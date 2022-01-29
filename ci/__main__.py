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


@cli.command("art-check")
def art_check():
    # Locate ``w4`` when running on GitHub
    kwargs = {}
    if "GITHUB_ACTIONS" in os.environ:
        kwargs["w4exe"] = os.path.join(CI_DIR, "w4")

    # Run the conversion
    convert(ASSETS_DIR, **kwargs)


@cli.command("img-info")
@click.argument("path", type=str, required=False)
@click.option("--all", is_flag=True, default=False)
def image_info(path, all):
    if all:
        show_directory_info(ASSETS_DIR)
    elif path:
        show_info(path)


@cli.command("img-norm")
def image_normalize():
    normalize(ASSETS_DIR)


@cli.command("img-swap-color")
@click.argument("path", type=str)
@click.option("--from", "from_color", type=str)
@click.option("--to", "to_color", type=str)
def image_color_swap(path, from_color, to_color):
    n = 4 if len(from_color) == 10 else 3
    getcolor = (lambda x: tuple(map(int, int(x, base=16).to_bytes(n, "big"))))
    from_color = getcolor(from_color)
    to_color = getcolor(to_color)
    swap_color(path, from_color, to_color)


if __name__ == "__main__":
    cli()
