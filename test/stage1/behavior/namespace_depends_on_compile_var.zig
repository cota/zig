const builtin = @import("builtin");
const expect = @import("std").testing.expect;

test "namespace depends on compile var" {
    if (some_namespace.a_bool) {
        expect(some_namespace.a_bool);
    } else {
        expect(!some_namespace.a_bool);
    }
}
const some_namespace = switch (builtin.os) {
    builtin.Os.linux => @import("namespace_depends_on_compile_var/a.zig"),
    else => @import("namespace_depends_on_compile_var/b.zig"),
};
