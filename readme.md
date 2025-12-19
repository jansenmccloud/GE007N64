# Goldeneye 007

[![NTSC-Status][NTCS-badge]][NTCS-link]
[![JP-Status][JP-badge]][JP-link]
[![PAL-Status][PAL-badge]][PAL-link]

[NTCS-link]: https://kholdfuzion.github.io/goldeneyestatus/
[NTCS-badge]: ../../workflows/NTSC-Status/badge.svg

[JP-link]: https://kholdfuzion.github.io/goldeneyestatus/JPN.htm
[JP-badge]: ../../workflows/JP-Status/badge.svg

[PAL-link]: https://kholdfuzion.github.io/goldeneyestatus/EU.htm
[PAL-badge]: ../../workflows/EU-Status/badge.svg

## About this fork

This fork is a personal clean up of the main repository that mirrors https://gitlab.com/kholdfuzion/goldeneye_src .
The fork helps me to understand the state of the decompilation project by updating the initial setup guide and reordering the project files.

Most of the project was done by other people that you can find in the git history and the references linked in the documents.

### Fork branches

[**>> hack_N64FishingRod_controlStyle**:](https://github.com/jansenmccloud/GE007N64/tree/hack_N64FishingRod_controlStyle)
* makes it possible to use the original N64 fishing rod controller to play goldeneye on original hardware!
* in-game control style "1.3 Kissy" is replaced by "1.3 Fishy":

| Action           | Controls                                 |
|------------------|------------------------------------------|
| standard fire    | A-Button                                 |
| gatling gun fire | Fishing Rod Crank forward (aka D-Pad Up) |
| move/ turn       | Joystick                                 |
| action           | B-Button                                 |
| next weapon      | R-Button, L-Button                       |
| strafe           | C Left / C Right                         |
| look             | C Up / C Down                            |
| pause            | Start                                    |

## About this repository

This is a WIP decompilation of Goldeneye 007!

It builds the following ROMs:

* ge007.u.z64 `sha1: abe01e4aeb033b6c0836819f549c791b26cfde83`
* ge007.j.z64 `sha1: 2a5dade32f7fad6c73c659d2026994632c1b3174`
* ge007.e.z64 `sha1: 167c3c433dec1f1eb921736f7d53fac8cb45ee31`

**Note: This repository does not include all assets necessary for compiling the ROMs. A prior copy of the game is required to extract the assets.**

## Documentation

* [Setup Guide:](./docs/SetupGuide.md) useful information about installing the necessary dependencies and how to use it
* [Structure Guide:](./docs/StructureGuide.md) learn more about the project structure of this repository
* [Style Guide:](./docs/StyleGuide.md) code style conventions if you want to contribute code
* [Error logs](./docs/errorlog.md) chronological protocol of errors during building or development for later investigation
