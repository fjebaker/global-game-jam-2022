import glob
import os

from PIL import Image


def common_palette(imgs):
    """ Given a list of images, find the union of all the colors used.
    """
    palette = set()
    for img in imgs:
        pal = _get_palette(img)
        palette.update(set(pal.values()))

    return palette


def dump_palette(img):
    """ Dump an image's palette.
    """
    print(f"Image dims: {img.width} x {img.height}")

    palette = _get_palette(img, counts=True)
    print(f"Number of colors: {len(palette)}\nColors:")

    # Show the colors
    for idx, (color, count) in palette.items():
        hexcode = "0x" + (("{:02x}"*len(color)).format(*color)).upper()
        print(f"\tIndex: {idx:3d} Hex: {hexcode} : {count} pixels")


def remap_palettes(imgs, palette):
    """ Remap the palettes of a collection of images.
    """
    remapped = []
    for img in imgs:
        pal = _get_palette(img)
        revpal = {v: k for k, v in pal.items()}
        # Start the map with 0 to preserve the magical first entry
        dest_map = [0] + [revpal[clr] for clr in palette if clr in revpal]
        # Then pad out the remainder to preserve the final entry
        dest_map += list(range(len(dest_map), 256))
        # Then remap
        fixed = img.convert(mode="P").remap_palette(dest_map)
        fixed.filename = img.filename
        remapped.append(fixed)

    return remapped


def show_directory_info(directory):
    """ Run ``show_info`` on all files in a directory.
    """
    pngpaths = glob.glob(os.path.join(directory, "*.png"))
    for path in pngpaths:
        show_info(path)
        print()


def show_info(path):
    """ Tell something about an image file at ``path``.
    """
    print(f"Showing details for: {os.path.basename(path)}")

    img = Image.open(path)
    dump_palette(img)


def _get_palette(img, counts=False):
    """ Return a sensible palette for an image.
    """
    indexed = img.convert(mode="P")
    paldata = indexed.palette.palette
    colorsize = len(paldata) // 256
    getcolor = (lambda idx: tuple(paldata[idx*colorsize:(idx+1)*colorsize]))
    return {
        idx: (getcolor(idx), count) if counts else getcolor(idx)
        for count, idx in indexed.getcolors()
    }
