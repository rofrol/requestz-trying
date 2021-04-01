Trying to use https://github.com/ducdetronquito/requestz

## Run

```
$ git clone --recurse-submodules https://github.com/rofrol/requestz-trying
$ cd requestz-trying
# zig-network targets 0.7.* not master
$ zig fmt vendor/requestz/lib/zig-network/network.zig
$ zig fmt vendor/requestz/lib/h11/lib/http/src/headers/headers.zig
$ zig fmt vendor/requestz/lib/h11/lib/http/src/headers/name.zig
$ zig fmt vendor/requestz/lib/h11/lib/http/src/methods.zig
$ zig fmt vendor/requestz/lib/h11/src/state_machines/client.zig
$ zig build
.\vendor\requestz\lib\zig-network\network.zig:1130:66: error: callconv 'Stdcall' is only available on x86, not x86_64
        extern "ws2_32" fn freeaddrinfo(res: *addrinfo) callconv(.Stdcall) void;
```
