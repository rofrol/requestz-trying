const std = @import("std");

const Client = @import("requestz").Client;

pub fn main() anyerror!void {
    std.log.info("All your codebase are belong to us.", .{});

    var client = try Client.init(std.testing.allocator);
    defer client.deinit();

    // var response = try client.get("http://httpbin.org/get", .{});
    // defer response.deinit();
}
