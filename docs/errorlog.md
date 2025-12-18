# Error log

This is a chronological protocol to keep track of error investigations and their solution approaches.

> **Newest entry is on top**

<!-- TOC -->
* [Error log](#error-log)
  * [build rom error [SOLVED]](#build-rom-error-solved)
    * [2025-12-18 | 004](#2025-12-18--004)
    * [2025-12-18 | 003](#2025-12-18--003)
    * [2025-12-18 | 002](#2025-12-18--002)
    * [2025-12-18 | 001](#2025-12-18--001)
<!-- TOC -->

## build rom error [SOLVED]

* *symptom:* after understanding and improving the setup I run into a building error
* *problem:* during experimenting I might have built the tools on a newer distro in docker
* *solution:* make clean of `tools/gzipsrc` and rebuild withe `make` in ubuntu 22.04

### 2025-12-18 | 004

* clean tools/gzipsrc before running again
* all base roms still extracted
* run with IDO recomp

Run:

> in tools/gzipsrc:
>
> make clean
>
> make

> in project root:
>
> sudo make clean
>
> sudo make

Result:

```
tools/1172compress.sh assets/music/Mwatercavernsx.bin build/u/assets/music/Mwatercavernsx.rz
tools/1172compress.sh assets/music/Mwindblowing.bin build/u/assets/music/Mwindblowing.rz
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/src/game/math_sincos.o src/game/math_sincos.s
as1: Warning: src/game/bg.c, line 12615: number outside range for single precision floating point values
as1: Warning: , line 0: number outside range for single precision floating point values
as1: Warning: src/game/fog.c, line 413: number outside range for single precision floating point values
as1: Warning: src/game/unk_0B3200.c, line 54: number outside range for single precision floating point values
as1: Warning: src/game/unk_0B3200.c, line 66: number outside range for single precision floating point values
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/ramrom/ramrom.o assets/ramrom/ramrom.s
tools/ido5.3_recomp/cc -c -Wab,-r4300_mul -non_shared -Olimit 2000 -G 0 -Xcpluscomm  -woff 609,649,709,712,807,838,763 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate -mips2 -32 -DVERSION_US -DLANG_US -DREFRESH_NTSC -DLEFTOVERDEBUG -DLEFTOVERSPECTRUM -DBUGFIX_R0 -DBYTEMATCH -DTARGET_N64 -o build/u/assets/font/fontBankGothic.o -O2 assets/font/fontBankGothic.c
tools/ido5.3_recomp/cc -c -Wab,-r4300_mul -non_shared -Olimit 2000 -G 0 -Xcpluscomm  -woff 609,649,709,712,807,838,763 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate -mips2 -32 -DVERSION_US -DLANG_US -DREFRESH_NTSC -DLEFTOVERDEBUG -DLEFTOVERSPECTRUM -DBUGFIX_R0 -DBYTEMATCH -DTARGET_N64 -o build/u/assets/font/fontZurichBold.o -O2 assets/font/fontZurichBold.c
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/instruments.ctl.o assets/music/instruments.ctl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/instruments.tbl.o assets/music/instruments.tbl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/music.o assets/music/music.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/sfx.ctl.o assets/music/sfx.ctl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/sfx.tbl.o assets/music/sfx.tbl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/obseg/ob_seg.o assets/obseg/ob_seg.s
cpp -DVERSION_US -DOUTCODE=u -P ge007.ld -o build/u/ge007.u.ld
Linking Files into ELF
mips-linux-gnu-ld -T build/u/ge007.u.ld -Map build/u/ge007.u.map --no-warn-mismatch -o build/u/ge007.u.elf
Building ROM
mips-linux-gnu-objcopy build/u/ge007.u.elf build/u/ge007.u.bin -O binary --gap-fill=0xff
Compressing ROM
tools/data_compress.sh build/u/ge007.u.bin u
patching build/u/ge007.u.bin
extract data segment
truncate build/u/ge007.u.bin to 0xc00000
compress data segment
inject data segment
size=71760
maxsize=72704
Finalizing ROM
tools/n64cksum build/u/ge007.u.bin build/u/ge007.u.z64
scripts/make/checksum.sh "sha1sum --quiet" "u" "build/u"


    MATCH!


Rom File Generated in Build Directory.
```

=> that fixed it :)

### 2025-12-18 | 003

* added gzip to distro in dockerfile
* base roms (US,JP,EU) still extracted
* run with IDO recomp

Run:
* same like in [002](#2025-12-18--build-rom-after-extraction---002)

Result:

```
tools/1172compress.sh assets/music/Mwatchmusic.bin build/u/assets/music/Mwatchmusic.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
tools/1172compress.sh assets/music/Mwatercaverns.bin build/u/assets/music/Mwatercaverns.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
tools/1172compress.sh assets/music/Mwatercavernsx.bin build/u/assets/music/Mwatercavernsx.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
tools/1172compress.sh assets/music/Mwindblowing.bin build/u/assets/music/Mwindblowing.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/src/game/math_sincos.o src/game/math_sincos.s
as1: Warning: src/game/bg.c, line 12615: number outside range for single precision floating point values
as1: Warning: , line 0: number outside range for single precision floating point values
as1: Warning: src/game/fog.c, line 413: number outside range for single precision floating point values
as1: Warning: src/game/unk_0B3200.c, line 54: number outside range for single precision floating point values
as1: Warning: src/game/unk_0B3200.c, line 66: number outside range for single precision floating point values
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/ramrom/ramrom.o assets/ramrom/ramrom.s
tools/ido5.3_recomp/cc -c -Wab,-r4300_mul -non_shared -Olimit 2000 -G 0 -Xcpluscomm  -woff 609,649,709,712,807,838,763 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate -mips2 -32 -DVERSION_US -DLANG_US -DREFRESH_NTSC -DLEFTOVERDEBUG -DLEFTOVERSPECTRUM -DBUGFIX_R0 -DBYTEMATCH -DTARGET_N64 -o build/u/assets/font/fontBankGothic.o -O2 assets/font/fontBankGothic.c
tools/ido5.3_recomp/cc -c -Wab,-r4300_mul -non_shared -Olimit 2000 -G 0 -Xcpluscomm  -woff 609,649,709,712,807,838,763 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate -mips2 -32 -DVERSION_US -DLANG_US -DREFRESH_NTSC -DLEFTOVERDEBUG -DLEFTOVERSPECTRUM -DBUGFIX_R0 -DBYTEMATCH -DTARGET_N64 -o build/u/assets/font/fontZurichBold.o -O2 assets/font/fontZurichBold.c
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/instruments.ctl.o assets/music/instruments.ctl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/instruments.tbl.o assets/music/instruments.tbl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/music.o assets/music/music.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/sfx.ctl.o assets/music/sfx.ctl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/sfx.tbl.o assets/music/sfx.tbl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/obseg/ob_seg.o assets/obseg/ob_seg.s
cpp -DVERSION_US -DOUTCODE=u -P ge007.ld -o build/u/ge007.u.ld
Linking Files into ELF
mips-linux-gnu-ld -T build/u/ge007.u.ld -Map build/u/ge007.u.map --no-warn-mismatch -o build/u/ge007.u.elf
Building ROM
mips-linux-gnu-objcopy build/u/ge007.u.elf build/u/ge007.u.bin -O binary --gap-fill=0xff
Compressing ROM
tools/data_compress.sh build/u/ge007.u.bin u
patching build/u/ge007.u.bin
extract data segment
truncate build/u/ge007.u.bin to 0xc00000
compress data segment
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
inject data segment
size=2
maxsize=72704
Finalizing ROM
tools/n64cksum build/u/ge007.u.bin build/u/ge007.u.z64
scripts/make/checksum.sh "sha1sum --quiet" "u" "build/u"
build/u/ge007.u.z64: FAILED
sha1sum: WARNING: 1 computed checksum did NOT match


    ERROR: NOT MATCH!


make: *** [Makefile:357: checksum] Error 1
```

=> same error, gzip installation didn't help

### 2025-12-18 | 002

* provided JP and EU base roms
* all base roms (US,JP,EU) are now extracted
* run with IDO recomp

Run:
> in tools/ido5.3_recomp:
>
> make clean
>
> make

> in project root:
>
> sudo make clean
>
> sudo make

Result:

```
...
tools/1172compress.sh assets/music/Mwatchmusic.bin build/u/assets/music/Mwatchmusic.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
tools/1172compress.sh assets/music/Mwatercaverns.bin build/u/assets/music/Mwatercaverns.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
tools/1172compress.sh assets/music/Mwatercavernsx.bin build/u/assets/music/Mwatercavernsx.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
tools/1172compress.sh assets/music/Mwindblowing.bin build/u/assets/music/Mwindblowing.rz
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/src/game/math_sincos.o src/game/math_sincos.s
as1: Warning: src/game/bg.c, line 12615: number outside range for single precision floating point values
as1: Warning: , line 0: number outside range for single precision floating point values
as1: Warning: src/game/fog.c, line 413: number outside range for single precision floating point values
as1: Warning: src/game/unk_0B3200.c, line 54: number outside range for single precision floating point values
as1: Warning: src/game/unk_0B3200.c, line 66: number outside range for single precision floating point values
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/ramrom/ramrom.o assets/ramrom/ramrom.s
tools/ido5.3_recomp/cc -c -Wab,-r4300_mul -non_shared -Olimit 2000 -G 0 -Xcpluscomm  -woff 609,649,709,712,807,838,763 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate -mips2 -32 -DVERSION_US -DLANG_US -DREFRESH_NTSC -DLEFTOVERDEBUG -DLEFTOVERSPECTRUM -DBUGFIX_R0 -DBYTEMATCH -DTARGET_N64 -o build/u/assets/font/fontBankGothic.o -O2 assets/font/fontBankGothic.c
tools/ido5.3_recomp/cc -c -Wab,-r4300_mul -non_shared -Olimit 2000 -G 0 -Xcpluscomm  -woff 609,649,709,712,807,838,763 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate -mips2 -32 -DVERSION_US -DLANG_US -DREFRESH_NTSC -DLEFTOVERDEBUG -DLEFTOVERSPECTRUM -DBUGFIX_R0 -DBYTEMATCH -DTARGET_N64 -o build/u/assets/font/fontZurichBold.o -O2 assets/font/fontZurichBold.c
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/instruments.ctl.o assets/music/instruments.ctl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/instruments.tbl.o assets/music/instruments.tbl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/music.o assets/music/music.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/sfx.ctl.o assets/music/sfx.ctl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/music/sfx.tbl.o assets/music/sfx.tbl.s
mips-linux-gnu-as -march=vr4300 -mabi=32 -I . -I include -I include/ultra64 -I include/PR -I src -I src/game -I src/inflate --defsym VERSION_US=1 --defsym LANG_US=1 --defsym REFRESH_NTSC=1 --defsym LEFTOVERDEBUG=1 --defsym LEFTOVERSPECTRUM=1 --defsym BUGFIX_R0=1 --defsym BYTEMATCH=1 -o build/u/assets/obseg/ob_seg.o assets/obseg/ob_seg.s
cpp -DVERSION_US -DOUTCODE=u -P ge007.ld -o build/u/ge007.u.ld
Linking Files into ELF
mips-linux-gnu-ld -T build/u/ge007.u.ld -Map build/u/ge007.u.map --no-warn-mismatch -o build/u/ge007.u.elf
Building ROM
mips-linux-gnu-objcopy build/u/ge007.u.elf build/u/ge007.u.bin -O binary --gap-fill=0xff
Compressing ROM
tools/data_compress.sh build/u/ge007.u.bin u
patching build/u/ge007.u.bin
extract data segment
truncate build/u/ge007.u.bin to 0xc00000
compress data segment
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
inject data segment
size=2
maxsize=72704
Finalizing ROM
tools/n64cksum build/u/ge007.u.bin build/u/ge007.u.z64
scripts/make/checksum.sh "sha1sum --quiet" "u" "build/u"
build/u/ge007.u.z64: FAILED
sha1sum: WARNING: 1 computed checksum did NOT match


    ERROR: NOT MATCH!


make: *** [Makefile:357: checksum] Error 1
```

=> same error like before, which should get fixed first before digging deeper:
`/lib/x86_64-linux-gnu/libc.so.6: version 'GLIBC_2.38' not found`

### 2025-12-18 | 001

* base rom US is extracted
* run without IDO recomp

Run:
> in project root:
>
> sudo make IDO_RECOMP=NO

Result

```
...
mips-linux-gnu-objcopy build/u/ge007.u.elf build/u/ge007.u.bin -O binary --gap-fill=0xff
Compressing ROM
tools/data_compress.sh build/u/ge007.u.bin u
make[1]: Entering directory '/home/dev/project/tools/aaa_rip'
make[1]: Leaving directory '/home/dev/project/tools/aaa_rip'
patching build/u/ge007.u.bin
extract data segment
truncate build/u/ge007.u.bin to 0xc00000
compress data segment
tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by tools/gzipsrc/gzip)
inject data segment
size=2
maxsize=72704
Finalizing ROM
tools/n64cksum build/u/ge007.u.bin build/u/ge007.u.z64
scripts/make/checksum.sh "sha1sum --quiet" "u" "build/u"
build/u/ge007.u.z64: FAILED
sha1sum: WARNING: 1 computed checksum did NOT match


    ERROR: NOT MATCH!


make: *** [Makefile:357: checksum] Error 1
```

this error here happens very often during build process and might have something to do with the end result:

`tools/gzipsrc/gzip: /lib/x86_64-linux-gnu/libc.so.6: version 'GLIBC_2.38' not found (required by tools/gzipsrc/gzip)`

=> running in distro ubuntu 24 or ubuntu 26 instead, failed earlier
=> the recompiled rom has the same size as the base rom
=> it was detected by the summercart64 as goldeneye
=> but got a black screen after starting the rom

