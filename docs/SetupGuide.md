# TODO - clean setup guide + TOC

## Installation

### Linux (Native or under WSL / VM)

#### Step 1: Install build dependencies

The requirements for Debian / Ubuntu should be:

```bash
sudo apt-get update
sudo apt-get install binutils-mips-linux-gnu make git python3
sudo apt-get install libcapstone-dev pkg-config
```

If you don't have host development tools already installed then you will also need to install `build-essential`:

```bash
sudo apt-get install build-essential
```

Additionally [qemu-irix](https://github.com/n64decomp/qemu-irix/releases) is needed. Download the package to a desired location and install with:

```bash
sudo dpkg -i qemu-irix-2.11.0-2169-g32ab296eef_amd64.deb
```

#### Step 2: Clone the repository

Clone this repository where you wish to have the project, with a command such as:

```bash
git clone https://github.com/kholdfuzion/goldeneye_src
```

#### Step 3: Recompile IDO

Recompile IDO for your platform for increased compile speed
```bash
cd tools/ido5.3_recomp
make
```

#### Step 4: Prepare baserom(s) for asset extraction

Place an unmodified copy of your existing NTSC (US) ROM inside the root of this repository with the name `baserom.u.z64`.

To extract the baserom assets run:

```bash
./scripts/extract_baserom.u.sh
```

For JP and PAL (EU) versions support, place each existing ROM in the root of this repository with the name `baserom.<VERSION>.z64` (where `<VERSION>` is the country code, `j`, or `e`).

Extracting NTSC (US) baserom assets is mandatory before extracting JP or PAL assets.

To extract JP assets run:

```bash
./scripts/extract_baserom.u.sh && ./scripts/extract_diff.j.sh
```

To extract PAL assets run:

```bash
./scripts/extract_baserom.u.sh && ./scripts/extract_diff.e.sh
```

Other options to extract baserom assets or extract diff:

```bash
./scripts/extract_baserom.u.sh /path_to/rom.n64 # ROM in another directory
./scripts/extract_baserom.u.sh /mnt/e/Goldeneye.n64 # ROM located on EverDrive
./scripts/extract_baserom.u.sh files # Extract files only
./scripts/extract_baserom.u.sh images # Extract images only
```

Note: If you are upgrading from an old repository, run:

```bash
./scripts/clean_baserom.sh && ./scripts/extract_baserom.u.sh && make clean
```

### Install using Docker (compatible with Apple silicon Macs)

Once the Docker service is running on your computer (you must have Docker installed), clone the GoldenEye repo where you'd like to have it (Step 2 of the previous section).

Build the image: `docker build -t goldeneye .`

`cd` to your cloned `goldeneye_src` repo's directory. You can change `$(pwd)` below to the absolute path of your directory if you don't want to do this.

Connect to the container: `docker run --rm -it -v $(pwd):/home/dev goldeneye`

All what's left is to go through Steps 3 and 4 of the previous section.

Be careful! If you previously compiled GoldenEye on another system (differente OS or CPU architecture), the binaries (gzip, n64cksum) that were compiled will be incompatible. You must delete them.

There may be a "dubious ownership" error from Git and it may say it fails to detect the Git repository. Running `git status`, it should tell you how to fix it.

## Build the ROM

Run `make` to build the ROM (defaults to `VERSION=US`).

```bash
make
```

If all goes well, resulting artifacts can be found in the `build` directory and the following text should be printed:

```bash
build/u/ge007.u.z64: OK
```

Other examples:

```bash
make VERSION=JP -j4       # build JP version instead with 4 jobs
make VERSION=EU COMPARE=0 # build PAL (EU) version but do not compare ROM hashes
```

The full list of configurable variables are listed below, with the default being the first listed:

* ``VERSION``: ``US``, ``JP``, ``EU``
* ``COMPARE``: ``1`` (compare ROM hash), ``0`` (do not compare ROM hash)
* ``IDO_RECOMP``: ``YES`` (build with IDO recomp), ``NO`` (build using [qemu-irix](https://github.com/n64decomp/qemu-irix/releases))
* ``FINAL``: ``YES`` (builds final version with -O2 optimization), ``NO`` (debug)
* ``VERBOSE``: ``0`` (quiet), ``1``

Additional documentation of the build process can be found in the next sections.



## Build details

## TODO clean up stucture

# Build Readme

This file explains the details of the build process.

# Requirements

It is required that `qemu-irix` be installed and available.

# Environment

The build uses the `US` version by default. Available options are `US`, `EU`, and `JP`. For example

    make clean VERSION=JP
    make VERSION=JP

# C Compiler

The c compiler can be found in `tools/irix/root/usr/bin/cc`. This splits the compilation process into several steps.

- cfe: compiler front end
- uopt: ?
- ugen: ?

# Assembly Preprocessor

There is a (much forked) preprocessor used by many N64 projects, found in `tools/asm-processor/asm_processor.py`. This searches for a line
beginning with `GLOBAL_ASM(` and a subsequent line beginning with `)` and treats everything in between as assembly. This is bundled with any
c code in the file and sent to the compiler.

# Code build process

`src` and `src/game`: .c and .s files are compiled into .o files

`src/libultra`: .c and .s files are compiled into .o files

# Asset/data build process

Before compilation begins, assets are converted into .c files. This file is then compiled using the c compiler in the usual manner.
Once an .o file exists, it is converted to an .elf file using the toolchain `-ld` program, and a .ld file specification explaining
where the ELF sections should arranged in the file (and also which sections to exclude). The toolchain `-objcopy` program is
then used to dump the data in the .elf file into a similar .bin file.

The .bin file is then compressed using the standard compression program to produce a .rz file.

For compilation, having a .c file is not necessary as long the correct .bin file is available. This can be created from the extract script.

Each obseg asset category has it's own `Makefile` in the obseg folder.

Once the .rz files exist for an asset category, they can be bundled together into an .o file. All obseg assets are bundled
in `assets/obseg/ob_seg.s` and music is bundled in `assets/music/music.s`.

# Building the final ROM

Once all code and assets are compiled into .o files, these are combined into one .elf file. The layout of the object files
is given by the `ge007.*.ld` files in the root of the project. For a list of individual methods, assets, and files see
the map file in `build/[uje]/ge007.*.map` (where `*` is the country code, `u`, `e`, or `j`).

The toolchain `-objcopy` program is then used to create the bundled .bin of the entire ROM.

The final step is to run the `tools/n64cksum` program on the .bin file to create the final .z64.
