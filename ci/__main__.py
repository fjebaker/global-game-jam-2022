import os

import click

from .imgconvert import convert, normalize, swap_color
from .imgpalette import show_info, show_directory_info

CI_DIR = os.path.abspath(os.path.dirname(__file__))
SRC_DIR = os.path.abspath(os.path.join(CI_DIR, "..", "src"))
ASSETS_DIR = os.path.join(SRC_DIR, "assets")


@click.group()
def cli():
    """ Top level group.
    """


@cli.command("img-convert")
def image_convert():
    """ Convert PNGs to Zig source. """
    convert(ASSETS_DIR)


@cli.command("img-info")
@click.argument("path", type=str, required=False)
@click.option("--all", is_flag=True, default=False)
def image_info(path, all):
    """ Dump size and palette information for one or all files. """
    if all:
        show_directory_info(ASSETS_DIR)
    elif path:
        show_info(path)


@cli.command("img-norm")
@click.option("--check", is_flag=True, default=False)
def image_normalize(check):
    """ Harmonize the palettes of all files. """
    normalize(ASSETS_DIR, check)


@cli.command("img-swap-color")
@click.argument("path", type=str)
@click.option("--from", "from_color", type=str)
@click.option("--to", "to_color", type=str)
def image_color_swap(path, from_color, to_color):
    """ Replace a single color in an image. """
    n = 4 if len(from_color) == 10 else 3
    getcolor = (lambda x: tuple(map(int, int(x, base=16).to_bytes(n, "big"))))
    from_color = getcolor(from_color)
    to_color = getcolor(to_color)
    swap_color(path, from_color, to_color)


if __name__ == "__main__":
    cli()
