import glob
import os
import subprocess

CI_DIR = os.path.abspath(os.path.dirname(__file__))
TEMPLATE = os.path.join(CI_DIR, "png2src.template")


def convert(assets_dir, w4exe="w4"):
    """ Convert all the PNG files in a directory to Zig source code.
    """
    pngpaths = glob.glob(os.path.join(assets_dir, "*.png"))
    for path in pngpaths:
        name = os.path.basename(path)
        print(f"Converting {name}")

        outpath = os.path.splitext(path)[0] + ".zig"
        cmd = [w4exe, "png2src", "-t", TEMPLATE, "-o", outpath, path]
        subprocess.check_call(cmd)
