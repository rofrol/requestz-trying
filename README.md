Trying to use https://github.com/ducdetronquito/requestz

## Run

```
$ git clone --recurse-submodules https://github.com/rofrol/requestz-trying
$ cd requestz-trying
$ zig build
\build.zig:2:18: error: unable to find 'vendor/packages.zig'
const packages = @import("vendor/packages.zig");
                 ^
.\build.zig:19:20: note: referenced here
    exe.addPackage(packages.requestz);
```
