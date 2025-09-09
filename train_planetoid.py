import argparse
import subprocess
import sys
from pathlib import Path


def main() -> None:
    """Run :mod:`train.py` on a Planetoid dataset.

    This thin wrapper simply forwards arguments to ``train.py`` while
    forcing ``--dataset`` to be one of the small Planetoid graphs such as
    ``Cora``, ``CiteSeer`` or ``PubMed``.  Additional command line flags
    are passed through unchanged so existing training options remain
    available.
    """
    parser = argparse.ArgumentParser(
        description="Wrapper around train.py for Planetoid datasets",
        add_help=True,
    )
    parser.add_argument(
        "--dataset",
        type=str,
        default="Cora",
        help="Name of the Planetoid dataset (e.g. Cora, CiteSeer, PubMed)",
    )
    parser.add_argument(
        "rest",
        nargs=argparse.REMAINDER,
        help="Additional arguments forwarded to train.py",
    )
    args = parser.parse_args()

    train_script = Path(__file__).with_name("train.py")
    cmd = [sys.executable, str(train_script), "--dataset", args.dataset]
    cmd.extend(args.rest)

    subprocess.run(cmd, check=True)


if __name__ == "__main__":
    main()
