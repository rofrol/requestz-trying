const std = @import("std");

pub const requestz = std.build.Pkg{
    .name = "requestz",
    .path = "vendor/requestz/src/main.zig",
    .dependencies = null,
};
