import glob
import os

from PIL import Image


def dump_palette(img):
    """ Dump an image's palette.
    """
    indexed = img.convert(mode="P")
    colors = indexed.getcolors()
    print(f"Number of colors: {len(colors)}\nColors:")

    # Show the colors
    paldata = indexed.palette.palette
    for count, idx in colors:
        color = paldata[idx*4:(idx+1)*4]
        hexcode = "0x" + (("{:02x}"*4).format(*color)).upper()
        print(f"\tIndex: {idx:3d} Hex: {hexcode} : {count} pixels")


def show_directory_info(directory):
    """ Run ``show_info`` on all files in a directory.
    """
    pngpaths = glob.glob(os.path.join(directory, "*.png"))
    for path in pngpaths:
        show_info(path)


def show_info(path):
    """ Tell something about an image file at ``path``.
    """
    print(f"Showing details for: {path}")

    img = Image.open(path)
    dump_palette(img)
