import glob
import os
import subprocess
import sys

from PIL import Image

from .imgpalette import common_palette, remap_palettes

CI_DIR = os.path.abspath(os.path.dirname(__file__))
TEMPLATE = os.path.join(CI_DIR, "png2src.template")


def convert(directory, w4exe="w4"):
    """ Convert all the PNG files in a directory to Zig source code.
    """
    pngpaths = glob.glob(os.path.join(directory, "*.png"))
    outpath = os.path.join(directory, "sprites.zig")
    print(f"Converting art in {directory}")

    _dump_images_to_source(sorted(pngpaths), outpath)

    print(f"Running `zig fmt` on {outpath}")
    cmd = ["zig", "fmt", outpath]
    subprocess.check_call(cmd)


def normalize(directory, check):
    """ "Normalize" all the PNG files in a directory to have matching palettes.
    """
    pngpaths = glob.glob(os.path.join(directory, "*.png"))
    imgs = [Image.open(path) for path in pngpaths]

    palette = common_palette(imgs)
    if len(palette) > 4:
        print("ERROR: The total number of colors for PNGs in {} is more than 4"
              .format(directory))
        sys.exit(1)

    TRANSPARENCY = (255, 0, 255, 255)
    if TRANSPARENCY not in palette:
        print("ERROR: One of the palette entries must be transparent")
        sys.exit(1)

    # If we're only checking, stop here.
    if check:
        return

    # Keep transparency last
    palette.discard(TRANSPARENCY)
    reordered = sorted(palette) + [TRANSPARENCY]

    # Remap all the images
    remapped = remap_palettes(imgs, reordered)
    for img in remapped:
        img.save(img.filename)


def swap_color(path, from_color, to_color):
    """ Replace all pixels of one color with pixels of another color.
    """
    img = Image.open(path)
    for x in range(img.width):
        for y in range(img.height):
            pos = (x, y)
            pixel = img.getpixel(pos)
            if pixel == from_color:
                img.putpixel(pos, to_color)
    img.save(path)


def _dump_images_to_source(imgpaths, outpath):
    """ Read in a collection of files and write them all to a source file.
    """

    def _pack_data(data):
        """ Pack groups of pixels into 2bpp representation. """
        count = len(data) // 4 + int(bool(len(data) % 4))
        outdata = bytearray(count)
        for idx in range(count):
            chunk = data[idx*4:(idx+1)*4]
            chunk = chunk + b"\x00"*(4-len(chunk))  # Don't check, just pad
            outdata[idx] = (
                (chunk[0]-1 << 6) | (chunk[1]-1 << 4) |
                (chunk[2]-1 << 2) | (chunk[3]-1)
            )
        return bytes(outdata)

    # Go through the images and collect their data
    imgdata = []
    for path in imgpaths:
        img = Image.open(path)
        if img.mode != "P":
            print(f"ERROR: {path} is not indexed. Run img-norm first.")
            sys.exit(1)

        name = os.path.splitext(os.path.basename(path))[0]
        packed = _pack_data(img.tobytes())
        imgdata.append({
            "name": name,
            "width": img.width,
            "height": img.height,
            "bytes": ",".join(f"0x{d:02x}" for d in packed),
            "length": len(packed),
            "flags": 1,
            "flagsHumanReadable": "BLIT_2BPP",
        })

    # Prepare the template
    with open(TEMPLATE, "r", encoding="utf8") as fp:
        template = fp.read()
    prefix, template, suffix = template.split("__TEMPLATE__")

    # Write the output
    with open(outpath, "w", encoding="utf8") as fp:
        fp.write(prefix)
        for data in imgdata:
            fp.write(template.format(**data))
        fp.write(suffix)
