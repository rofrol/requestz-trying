Trying to use https://github.com/ducdetronquito/requestz

## Run

```
$ git clone --recurse-submodules https://github.com/rofrol/requestz-trying
$ cd requestz-trying
# zig-network targets 0.7.* not master
$ zig fmt vendor/requestz/lib/zig-network/network.zig
$ zig build
.\vendor\requestz\src\response.zig:5:20: error: unable to find 'http'
const StatusCode = @import("http").StatusCode;
                   ^
.\vendor\requestz\src\response.zig:15:13: note: referenced here
    status: StatusCode,
            ^
.\src\main.zig:11:34: note: referenced here
    var response = try client.get("http://httpbin.org/get", .{});
```
