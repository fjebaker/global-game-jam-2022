import argparse
import glob
import os
import subprocess

HERE = os.path.abspath(os.path.dirname(__file__))
TEMPLATE = os.path.join(HERE, "png2src.template")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('directory')
    args = parser.parse_args()

    assets_dir = os.path.abspath(args.directory)
    pngpaths = glob.glob(os.path.join(assets_dir, "*.png"))
    for path in pngpaths:
        name = os.path.basename(path)
        outpath = os.path.splitext(path)[0] + ".zig"
        print(f"Converting {name}")
        cmd = ["w4", "png2src", "-t", TEMPLATE, "-o", outpath, path]
        subprocess.check_call(cmd)



if __name__ == "__main__":
    main()
