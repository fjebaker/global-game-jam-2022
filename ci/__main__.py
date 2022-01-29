import os

import click

from .imgconvert import convert

CI_DIR = os.path.abspath(os.path.dirname(__file__))
SRC_DIR = os.path.abspath(os.path.join(CI_DIR, "..", "src"))


@click.group()
def cli():
    """ Top level group.
    """


@cli.command("art-check")
def art_check():
    assets_dir = os.path.join(SRC_DIR, "assets")

    # Locate ``w4`` when running on GitHub
    kwargs = {}
    if "GITHUB_ACTIONS" in os.environ:
        kwargs["w4exe"] = os.path.join(CI_DIR, "w4")

    # Run the conversion
    convert(assets_dir, **kwargs)


if __name__ == "__main__":
    cli()
