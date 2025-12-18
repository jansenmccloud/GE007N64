# error log after trying to build rom

2025-12-18

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
