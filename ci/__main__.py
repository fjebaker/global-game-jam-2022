import os

import click

from .imgconvert import convert
from .imginfo import show_info, show_directory_info

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
    else:
        show_info(path)


if __name__ == "__main__":
    cli()
