const std = @import("std");

// Ideally we'd use vendor/requestz/lib/packages.zig directly, but not sure
// how best to deal with relative paths (since it tries to resolve them from
// our root).

pub const network = std.build.Pkg{
    .name = "network",
    .path = "vendor/requestz/lib/zig-network/network.zig",
    .dependencies = null,
};

pub const http = std.build.Pkg{
    .name = "http",
    .path = "vendor/requestz/lib/h11/lib/http/src/main.zig",
    .dependencies = null,
};

var h11_dependencies = [_]std.build.Pkg{
    http,
};

pub const h11 = std.build.Pkg{
    .name = "h11",
    .path = "vendor/requestz/lib/h11/src/main.zig",
    .dependencies = &h11_dependencies,
};

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("requestz-trying", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.addPackage(.{ .name = "requestz", .path = "vendor/requestz/src/main.zig", .dependencies = &.{
        network,
        h11,
    } });
    exe.addPackage(http);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
