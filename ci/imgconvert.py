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
    for path in pngpaths:
        name = os.path.basename(path)
        print(f"Converting {name}")

        outpath = os.path.splitext(path)[0] + ".zig"
        cmd = [w4exe, "png2src", "-t", TEMPLATE, "-o", outpath, path]
        subprocess.check_call(cmd)

    print(f"Running `zig fmt`")
    cmd = ["zig", "fmt", directory]
    subprocess.check_call(cmd)


def normalize(directory):
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
