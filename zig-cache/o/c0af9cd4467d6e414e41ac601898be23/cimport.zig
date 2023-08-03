pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const wchar_t = c_int;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub const div_t = extern struct {
    quot: c_int,
    rem: c_int,
};
pub const ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
pub const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub fn atof(arg___nptr: [*c]const u8) callconv(.C) f64 {
    var __nptr = arg___nptr;
    return strtod(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))));
}
pub fn atoi(arg___nptr: [*c]const u8) callconv(.C) c_int {
    var __nptr = arg___nptr;
    return @as(c_int, @bitCast(@as(c_int, @truncate(strtol(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))), @as(c_int, 10))))));
}
pub fn atol(arg___nptr: [*c]const u8) callconv(.C) c_long {
    var __nptr = arg___nptr;
    return strtol(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))), @as(c_int, 10));
}
pub fn atoll(arg___nptr: [*c]const u8) callconv(.C) c_longlong {
    var __nptr = arg___nptr;
    return strtoll(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))), @as(c_int, 10));
}
pub extern fn strtod(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f64;
pub extern fn strtof(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f32;
pub extern fn strtold(__nptr: [*c]const u8, __endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtol(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strtoll(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int,
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.C) __uint16_t {
    var __bsx = arg___bsx;
    return @as(__uint16_t, @bitCast(@as(c_short, @truncate(((@as(c_int, @bitCast(@as(c_uint, __bsx))) >> @intCast(8)) & @as(c_int, 255)) | ((@as(c_int, @bitCast(@as(c_uint, __bsx))) & @as(c_int, 255)) << @intCast(8))))));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.C) __uint32_t {
    var __bsx = arg___bsx;
    return ((((__bsx & @as(c_uint, 4278190080)) >> @intCast(24)) | ((__bsx & @as(c_uint, 16711680)) >> @intCast(8))) | ((__bsx & @as(c_uint, 65280)) << @intCast(8))) | ((__bsx & @as(c_uint, 255)) << @intCast(24));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.C) __uint64_t {
    var __bsx = arg___bsx;
    return @as(__uint64_t, @bitCast(@as(c_ulong, @truncate(((((((((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 18374686479671623680)) >> @intCast(56)) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 71776119061217280)) >> @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 280375465082880)) >> @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 1095216660480)) >> @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 4278190080)) << @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 16711680)) << @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 65280)) << @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 255)) << @intCast(56))))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.C) __uint16_t {
    var __x = arg___x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.C) __uint32_t {
    var __x = arg___x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.C) __uint64_t {
    var __x = arg___x;
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong,
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t,
    tv_usec: __suseconds_t,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask,
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
const struct_unnamed_1 = extern struct {
    __low: c_uint,
    __high: c_uint,
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_1,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list,
    __next: [*c]struct___pthread_internal_list,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist,
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int,
    __count: c_uint,
    __owner: c_int,
    __nusers: c_uint,
    __kind: c_int,
    __spins: c_short,
    __elision: c_short,
    __list: __pthread_list_t,
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint,
    __writers: c_uint,
    __wrphase_futex: c_uint,
    __writers_futex: c_uint,
    __pad3: c_uint,
    __pad4: c_uint,
    __cur_writer: c_int,
    __shared: c_int,
    __rwelision: i8,
    __pad1: [7]u8,
    __pad2: c_ulong,
    __flags: c_uint,
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter,
    __g1_start: __atomic_wide_counter,
    __g_refs: [2]c_uint,
    __g_size: [2]c_uint,
    __g1_orig_size: c_uint,
    __wrefs: c_uint,
    __g_signals: [2]c_uint,
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32,
    rptr: [*c]i32,
    state: [*c]i32,
    rand_type: c_int,
    rand_deg: c_int,
    rand_sep: c_int,
    end_ptr: [*c]i32,
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort,
    __old_x: [3]c_ushort,
    __c: c_ushort,
    __init: c_ushort,
    __a: c_ulonglong,
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn malloc(__size: c_ulong) ?*anyopaque;
pub extern fn calloc(__nmemb: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: c_ulong) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn reallocarray(__ptr: ?*anyopaque, __nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn alloca(__size: c_ulong) ?*anyopaque;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?*const fn () callconv(.C) void) c_int;
pub extern fn at_quick_exit(__func: ?*const fn () callconv(.C) void) c_int;
pub extern fn on_exit(__func: ?*const fn (c_int, ?*anyopaque) callconv(.C) void, __arg: ?*anyopaque) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.C) c_int;
pub fn bsearch(arg___key: ?*const anyopaque, arg___base: ?*const anyopaque, arg___nmemb: usize, arg___size: usize, arg___compar: __compar_fn_t) callconv(.C) ?*anyopaque {
    var __key = arg___key;
    var __base = arg___base;
    var __nmemb = arg___nmemb;
    var __size = arg___size;
    var __compar = arg___compar;
    var __l: usize = undefined;
    var __u: usize = undefined;
    var __idx: usize = undefined;
    var __p: ?*const anyopaque = undefined;
    var __comparison: c_int = undefined;
    __l = 0;
    __u = __nmemb;
    while (__l < __u) {
        __idx = (__l +% __u) / @as(usize, @bitCast(@as(c_long, @as(c_int, 2))));
        __p = @as(?*const anyopaque, @ptrCast(@as([*c]const u8, @ptrCast(@alignCast(__base))) + (__idx *% __size)));
        __comparison = __compar.?(__key, __p);
        if (__comparison < @as(c_int, 0)) {
            __u = __idx;
        } else if (__comparison > @as(c_int, 0)) {
            __l = __idx +% @as(usize, @bitCast(@as(c_long, @as(c_int, 1))));
        } else {
            return @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(__p))));
        }
    }
    return @as(?*anyopaque, @ptrFromInt(@as(c_int, 0)));
}
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub extern fn wctomb(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn wcstombs(noalias __s: [*c]u8, noalias __pwcs: [*c]const wchar_t, __n: usize) usize;
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c][*c]u8, noalias __tokens: [*c]const [*c]u8, noalias __valuep: [*c][*c]u8) c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub export var stbi_write_tga_with_rle: c_int = 1;
pub export var stbi_write_png_compression_level: c_int = 8;
pub export var stbi_write_force_png_filter: c_int = -@as(c_int, 1);
pub const struct__IO_marker = opaque {};
pub const _IO_lock_t = anyopaque;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const struct__IO_FILE = extern struct {
    _flags: c_int,
    _IO_read_ptr: [*c]u8,
    _IO_read_end: [*c]u8,
    _IO_read_base: [*c]u8,
    _IO_write_base: [*c]u8,
    _IO_write_ptr: [*c]u8,
    _IO_write_end: [*c]u8,
    _IO_buf_base: [*c]u8,
    _IO_buf_end: [*c]u8,
    _IO_save_base: [*c]u8,
    _IO_backup_base: [*c]u8,
    _IO_save_end: [*c]u8,
    _markers: ?*struct__IO_marker,
    _chain: [*c]struct__IO_FILE,
    _fileno: c_int,
    _flags2: c_int,
    _old_offset: __off_t,
    _cur_column: c_ushort,
    _vtable_offset: i8,
    _shortbuf: [1]u8,
    _lock: ?*_IO_lock_t,
    _offset: __off64_t,
    _codecvt: ?*struct__IO_codecvt,
    _wide_data: ?*struct__IO_wide_data,
    _freeres_list: [*c]struct__IO_FILE,
    _freeres_buf: ?*anyopaque,
    __pad5: usize,
    _mode: c_int,
    _unused2: [20]u8,
};
pub const FILE = struct__IO_FILE;
pub fn stbi_write_png(arg_filename: [*c]const u8, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque, arg_stride_bytes: c_int) callconv(.C) c_int {
    var filename = arg_filename;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var stride_bytes = arg_stride_bytes;
    var f: [*c]FILE = undefined;
    var len: c_int = undefined;
    var png: [*c]u8 = stbi_write_png_to_mem(@as([*c]const u8, @ptrCast(@alignCast(data))), stride_bytes, x, y, comp, &len);
    if (png == @as([*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) return 0;
    f = stbiw__fopen(filename, "wb");
    if (!(f != null)) {
        free(@as(?*anyopaque, @ptrCast(png)));
        return 0;
    }
    _ = fwrite(@as(?*const anyopaque, @ptrCast(png)), @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))), @as(c_ulong, @bitCast(@as(c_long, len))), f);
    _ = fclose(f);
    free(@as(?*anyopaque, @ptrCast(png)));
    return 1;
}
pub fn stbi_write_bmp(arg_filename: [*c]const u8, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque) callconv(.C) c_int {
    var filename = arg_filename;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    if (stbi__start_write_file(&s, filename) != 0) {
        var r: c_int = stbi_write_bmp_core(&s, x, y, comp, data);
        stbi__end_write_file(&s);
        return r;
    } else return 0;
    return 0;
}
pub fn stbi_write_tga(arg_filename: [*c]const u8, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque) callconv(.C) c_int {
    var filename = arg_filename;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    if (stbi__start_write_file(&s, filename) != 0) {
        var r: c_int = stbi_write_tga_core(&s, x, y, comp, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(data)))));
        stbi__end_write_file(&s);
        return r;
    } else return 0;
    return 0;
}
pub fn stbi_write_hdr(arg_filename: [*c]const u8, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: [*c]const f32) callconv(.C) c_int {
    var filename = arg_filename;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    if (stbi__start_write_file(&s, filename) != 0) {
        var r: c_int = stbi_write_hdr_core(&s, x, y, comp, @as([*c]f32, @ptrCast(@volatileCast(@constCast(data)))));
        stbi__end_write_file(&s);
        return r;
    } else return 0;
    return 0;
}
pub fn stbi_write_jpg(arg_filename: [*c]const u8, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque, arg_quality: c_int) callconv(.C) c_int {
    var filename = arg_filename;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var quality = arg_quality;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    if (stbi__start_write_file(&s, filename) != 0) {
        var r: c_int = stbi_write_jpg_core(&s, x, y, comp, data, quality);
        stbi__end_write_file(&s);
        return r;
    } else return 0;
    return 0;
}
pub const stbi_write_func = fn (?*anyopaque, ?*anyopaque, c_int) callconv(.C) void;
pub fn stbi_write_png_to_func(arg_func: ?*const stbi_write_func, arg_context: ?*anyopaque, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque, arg_stride_bytes: c_int) callconv(.C) c_int {
    var func = arg_func;
    var context = arg_context;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var stride_bytes = arg_stride_bytes;
    var len: c_int = undefined;
    var png: [*c]u8 = stbi_write_png_to_mem(@as([*c]const u8, @ptrCast(@alignCast(data))), stride_bytes, x, y, comp, &len);
    if (png == @as([*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) return 0;
    func.?(context, @as(?*anyopaque, @ptrCast(png)), len);
    free(@as(?*anyopaque, @ptrCast(png)));
    return 1;
}
pub fn stbi_write_bmp_to_func(arg_func: ?*const stbi_write_func, arg_context: ?*anyopaque, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque) callconv(.C) c_int {
    var func = arg_func;
    var context = arg_context;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    stbi__start_write_callbacks(&s, func, context);
    return stbi_write_bmp_core(&s, x, y, comp, data);
}
pub fn stbi_write_tga_to_func(arg_func: ?*const stbi_write_func, arg_context: ?*anyopaque, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque) callconv(.C) c_int {
    var func = arg_func;
    var context = arg_context;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    stbi__start_write_callbacks(&s, func, context);
    return stbi_write_tga_core(&s, x, y, comp, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(data)))));
}
pub fn stbi_write_hdr_to_func(arg_func: ?*const stbi_write_func, arg_context: ?*anyopaque, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: [*c]const f32) callconv(.C) c_int {
    var func = arg_func;
    var context = arg_context;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    stbi__start_write_callbacks(&s, func, context);
    return stbi_write_hdr_core(&s, x, y, comp, @as([*c]f32, @ptrCast(@volatileCast(@constCast(data)))));
}
pub fn stbi_write_jpg_to_func(arg_func: ?*const stbi_write_func, arg_context: ?*anyopaque, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque, arg_quality: c_int) callconv(.C) c_int {
    var func = arg_func;
    var context = arg_context;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var quality = arg_quality;
    var s: stbi__write_context = stbi__write_context{
        .func = null,
        .context = null,
        .buffer = @import("std").mem.zeroes([64]u8),
        .buf_used = 0,
    };
    stbi__start_write_callbacks(&s, func, context);
    return stbi_write_jpg_core(&s, x, y, comp, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(data)))), quality);
}
pub fn stbi_flip_vertically_on_write(arg_flag: c_int) callconv(.C) void {
    var flag = arg_flag;
    stbi__flip_vertically_on_write = flag;
}
pub const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*anyopaque,
    reg_save_area: ?*anyopaque,
};
pub const __builtin_va_list = [1]struct___va_list_tag;
pub const __gnuc_va_list = __builtin_va_list;
const union_unnamed_2 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int,
    __value: union_unnamed_2,
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t,
    __state: __mbstate_t,
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t,
    __state: __mbstate_t,
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const __FILE = struct__IO_FILE;
pub const va_list = __gnuc_va_list;
pub const fpos_t = __fpos_t;
pub extern var stdin: [*c]FILE;
pub extern var stdout: [*c]FILE;
pub extern var stderr: [*c]FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn fclose(__stream: [*c]FILE) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: [*c]FILE) c_int;
pub extern fn fflush_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fopen(__filename: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) [*c]FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) [*c]FILE;
pub extern fn setbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: [*c]FILE) void;
pub extern fn fprintf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int;
pub extern fn printf(__format: [*c]const u8, ...) c_int;
pub extern fn sprintf(__s: [*c]u8, __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(__s: [*c]FILE, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub fn vprintf(arg___fmt: [*c]const u8, arg___arg: [*c]struct___va_list_tag) callconv(.C) c_int {
    var __fmt = arg___fmt;
    var __arg = arg___arg;
    return vfprintf(stdout, __fmt, __arg);
}
pub extern fn vsprintf(__s: [*c]u8, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn snprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn fgetc(__stream: [*c]FILE) c_int;
pub extern fn getc(__stream: [*c]FILE) c_int;
pub fn getchar() callconv(.C) c_int {
    return getc(stdin);
}
pub fn getc_unlocked(arg___fp: [*c]FILE) callconv(.C) c_int {
    var __fp = arg___fp;
    return if (__builtin_expect(@as(c_long, @intFromBool(__fp.*._IO_read_ptr >= __fp.*._IO_read_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __uflow(__fp) else @as(c_int, @bitCast(@as(c_uint, @as([*c]u8, @ptrCast(@alignCast(blk: {
        const ref = &__fp.*._IO_read_ptr;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }))).*)));
}
pub fn getchar_unlocked() callconv(.C) c_int {
    return if (__builtin_expect(@as(c_long, @intFromBool(stdin.*._IO_read_ptr >= stdin.*._IO_read_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __uflow(stdin) else @as(c_int, @bitCast(@as(c_uint, @as([*c]u8, @ptrCast(@alignCast(blk: {
        const ref = &stdin.*._IO_read_ptr;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }))).*)));
}
pub fn fgetc_unlocked(arg___fp: [*c]FILE) callconv(.C) c_int {
    var __fp = arg___fp;
    return if (__builtin_expect(@as(c_long, @intFromBool(__fp.*._IO_read_ptr >= __fp.*._IO_read_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __uflow(__fp) else @as(c_int, @bitCast(@as(c_uint, @as([*c]u8, @ptrCast(@alignCast(blk: {
        const ref = &__fp.*._IO_read_ptr;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }))).*)));
}
pub extern fn fputc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc(__c: c_int, __stream: [*c]FILE) c_int;
pub fn putchar(arg___c: c_int) callconv(.C) c_int {
    var __c = arg___c;
    return putc(__c, stdout);
}
pub fn fputc_unlocked(arg___c: c_int, arg___stream: [*c]FILE) callconv(.C) c_int {
    var __c = arg___c;
    var __stream = arg___stream;
    return if (__builtin_expect(@as(c_long, @intFromBool(__stream.*._IO_write_ptr >= __stream.*._IO_write_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __overflow(__stream, @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(@as(i8, @truncate(__c)))))))) else @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(blk: {
        const tmp = @as(u8, @bitCast(@as(i8, @truncate(__c))));
        (blk_1: {
            const ref = &__stream.*._IO_write_ptr;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })))));
}
pub fn putc_unlocked(arg___c: c_int, arg___stream: [*c]FILE) callconv(.C) c_int {
    var __c = arg___c;
    var __stream = arg___stream;
    return if (__builtin_expect(@as(c_long, @intFromBool(__stream.*._IO_write_ptr >= __stream.*._IO_write_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __overflow(__stream, @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(@as(i8, @truncate(__c)))))))) else @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(blk: {
        const tmp = @as(u8, @bitCast(@as(i8, @truncate(__c))));
        (blk_1: {
            const ref = &__stream.*._IO_write_ptr;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })))));
}
pub fn putchar_unlocked(arg___c: c_int) callconv(.C) c_int {
    var __c = arg___c;
    return if (__builtin_expect(@as(c_long, @intFromBool(stdout.*._IO_write_ptr >= stdout.*._IO_write_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __overflow(stdout, @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(@as(i8, @truncate(__c)))))))) else @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(blk: {
        const tmp = @as(u8, @bitCast(@as(i8, @truncate(__c))));
        (blk_1: {
            const ref = &stdout.*._IO_write_ptr;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })))));
}
pub extern fn getw(__stream: [*c]FILE) c_int;
pub extern fn putw(__w: c_int, __stream: [*c]FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*anyopaque, __size: c_ulong, __n: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn fwrite(__ptr: ?*const anyopaque, __size: c_ulong, __n: c_ulong, __s: [*c]FILE) c_ulong;
pub extern fn fread_unlocked(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fseek(__stream: [*c]FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: [*c]FILE) c_long;
pub extern fn rewind(__stream: [*c]FILE) void;
pub extern fn fseeko(__stream: [*c]FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) __off_t;
pub extern fn fgetpos(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: [*c]FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: [*c]FILE) void;
pub extern fn feof(__stream: [*c]FILE) c_int;
pub extern fn ferror(__stream: [*c]FILE) c_int;
pub extern fn clearerr_unlocked(__stream: [*c]FILE) void;
pub fn feof_unlocked(arg___stream: [*c]FILE) callconv(.C) c_int {
    var __stream = arg___stream;
    return @intFromBool((__stream.*._flags & @as(c_int, 16)) != @as(c_int, 0));
}
pub fn ferror_unlocked(arg___stream: [*c]FILE) callconv(.C) c_int {
    var __stream = arg___stream;
    return @intFromBool((__stream.*._flags & @as(c_int, 32)) != @as(c_int, 0));
}
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: [*c]FILE) c_int;
pub extern fn fileno_unlocked(__stream: [*c]FILE) c_int;
pub extern fn pclose(__stream: [*c]FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: [*c]FILE) void;
pub extern fn ftrylockfile(__stream: [*c]FILE) c_int;
pub extern fn funlockfile(__stream: [*c]FILE) void;
pub extern fn __uflow([*c]FILE) c_int;
pub extern fn __overflow([*c]FILE, c_int) c_int;
pub extern fn memcpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn memccpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: c_ulong) c_int;
pub extern fn __memcmpeq(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn memchr(__s: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn strcpy(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strncpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strcat(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strncat(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strxfrm(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) c_ulong;
pub const struct___locale_data = opaque {};
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data,
    __ctype_b: [*c]const c_ushort,
    __ctype_tolower: [*c]const c_int,
    __ctype_toupper: [*c]const c_int,
    __names: [13][*c]const u8,
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn strcoll_l(__s1: [*c]const u8, __s2: [*c]const u8, __l: locale_t) c_int;
pub extern fn strxfrm_l(__dest: [*c]u8, __src: [*c]const u8, __n: usize, __l: locale_t) usize;
pub extern fn strdup(__s: [*c]const u8) [*c]u8;
pub extern fn strndup(__string: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __reject: [*c]const u8) c_ulong;
pub extern fn strspn(__s: [*c]const u8, __accept: [*c]const u8) c_ulong;
pub extern fn strpbrk(__s: [*c]const u8, __accept: [*c]const u8) [*c]u8;
pub extern fn strstr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn strtok(__s: [*c]u8, __delim: [*c]const u8) [*c]u8;
pub extern fn __strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strlen(__s: [*c]const u8) c_ulong;
pub extern fn strnlen(__string: [*c]const u8, __maxlen: usize) usize;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn strerror_l(__errnum: c_int, __l: locale_t) [*c]u8;
pub extern fn bcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: c_ulong) c_int;
pub extern fn bcopy(__src: ?*const anyopaque, __dest: ?*anyopaque, __n: usize) void;
pub extern fn bzero(__s: ?*anyopaque, __n: c_ulong) void;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn rindex(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn ffs(__i: c_int) c_int;
pub extern fn ffsl(__l: c_long) c_int;
pub extern fn ffsll(__ll: c_longlong) c_int;
pub extern fn strcasecmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncasecmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strcasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __loc: locale_t) c_int;
pub extern fn strncasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize, __loc: locale_t) c_int;
pub extern fn explicit_bzero(__s: ?*anyopaque, __n: usize) void;
pub extern fn strsep(noalias __stringp: [*c][*c]u8, noalias __delim: [*c]const u8) [*c]u8;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub extern fn __stpcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn stpcpy(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn __stpncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn stpncpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub const float_t = f32;
pub const double_t = f64;
pub extern fn __fpclassify(__value: f64) c_int;
pub extern fn __signbit(__value: f64) c_int;
pub extern fn __isinf(__value: f64) c_int;
pub extern fn __finite(__value: f64) c_int;
pub extern fn __isnan(__value: f64) c_int;
pub extern fn __iseqsig(__x: f64, __y: f64) c_int;
pub extern fn __issignaling(__value: f64) c_int;
pub extern fn acos(__x: f64) f64;
pub extern fn __acos(__x: f64) f64;
pub extern fn asin(__x: f64) f64;
pub extern fn __asin(__x: f64) f64;
pub extern fn atan(__x: f64) f64;
pub extern fn __atan(__x: f64) f64;
pub extern fn atan2(__y: f64, __x: f64) f64;
pub extern fn __atan2(__y: f64, __x: f64) f64;
pub extern fn cos(__x: f64) f64;
pub extern fn __cos(__x: f64) f64;
pub extern fn sin(__x: f64) f64;
pub extern fn __sin(__x: f64) f64;
pub extern fn tan(__x: f64) f64;
pub extern fn __tan(__x: f64) f64;
pub extern fn cosh(__x: f64) f64;
pub extern fn __cosh(__x: f64) f64;
pub extern fn sinh(__x: f64) f64;
pub extern fn __sinh(__x: f64) f64;
pub extern fn tanh(__x: f64) f64;
pub extern fn __tanh(__x: f64) f64;
pub extern fn acosh(__x: f64) f64;
pub extern fn __acosh(__x: f64) f64;
pub extern fn asinh(__x: f64) f64;
pub extern fn __asinh(__x: f64) f64;
pub extern fn atanh(__x: f64) f64;
pub extern fn __atanh(__x: f64) f64;
pub extern fn exp(__x: f64) f64;
pub extern fn __exp(__x: f64) f64;
pub extern fn frexp(__x: f64, __exponent: [*c]c_int) f64;
pub extern fn __frexp(__x: f64, __exponent: [*c]c_int) f64;
pub extern fn ldexp(__x: f64, __exponent: c_int) f64;
pub extern fn __ldexp(__x: f64, __exponent: c_int) f64;
pub extern fn log(__x: f64) f64;
pub extern fn __log(__x: f64) f64;
pub extern fn log10(__x: f64) f64;
pub extern fn __log10(__x: f64) f64;
pub extern fn modf(__x: f64, __iptr: [*c]f64) f64;
pub extern fn __modf(__x: f64, __iptr: [*c]f64) f64;
pub extern fn expm1(__x: f64) f64;
pub extern fn __expm1(__x: f64) f64;
pub extern fn log1p(__x: f64) f64;
pub extern fn __log1p(__x: f64) f64;
pub extern fn logb(__x: f64) f64;
pub extern fn __logb(__x: f64) f64;
pub extern fn exp2(__x: f64) f64;
pub extern fn __exp2(__x: f64) f64;
pub extern fn log2(__x: f64) f64;
pub extern fn __log2(__x: f64) f64;
pub extern fn pow(__x: f64, __y: f64) f64;
pub extern fn __pow(__x: f64, __y: f64) f64;
pub extern fn sqrt(__x: f64) f64;
pub extern fn __sqrt(__x: f64) f64;
pub extern fn hypot(__x: f64, __y: f64) f64;
pub extern fn __hypot(__x: f64, __y: f64) f64;
pub extern fn cbrt(__x: f64) f64;
pub extern fn __cbrt(__x: f64) f64;
pub extern fn ceil(__x: f64) f64;
pub extern fn __ceil(__x: f64) f64;
pub extern fn fabs(__x: f64) f64;
pub extern fn __fabs(__x: f64) f64;
pub extern fn floor(__x: f64) f64;
pub extern fn __floor(__x: f64) f64;
pub extern fn fmod(__x: f64, __y: f64) f64;
pub extern fn __fmod(__x: f64, __y: f64) f64;
pub extern fn isinf(__value: f64) c_int;
pub extern fn finite(__value: f64) c_int;
pub extern fn drem(__x: f64, __y: f64) f64;
pub extern fn __drem(__x: f64, __y: f64) f64;
pub extern fn significand(__x: f64) f64;
pub extern fn __significand(__x: f64) f64;
pub extern fn copysign(__x: f64, __y: f64) f64;
pub extern fn __copysign(__x: f64, __y: f64) f64;
pub extern fn nan(__tagb: [*c]const u8) f64;
pub extern fn __nan(__tagb: [*c]const u8) f64;
pub extern fn isnan(__value: f64) c_int;
pub extern fn j0(f64) f64;
pub extern fn __j0(f64) f64;
pub extern fn j1(f64) f64;
pub extern fn __j1(f64) f64;
pub extern fn jn(c_int, f64) f64;
pub extern fn __jn(c_int, f64) f64;
pub extern fn y0(f64) f64;
pub extern fn __y0(f64) f64;
pub extern fn y1(f64) f64;
pub extern fn __y1(f64) f64;
pub extern fn yn(c_int, f64) f64;
pub extern fn __yn(c_int, f64) f64;
pub extern fn erf(f64) f64;
pub extern fn __erf(f64) f64;
pub extern fn erfc(f64) f64;
pub extern fn __erfc(f64) f64;
pub extern fn lgamma(f64) f64;
pub extern fn __lgamma(f64) f64;
pub extern fn tgamma(f64) f64;
pub extern fn __tgamma(f64) f64;
pub extern fn gamma(f64) f64;
pub extern fn __gamma(f64) f64;
pub extern fn lgamma_r(f64, __signgamp: [*c]c_int) f64;
pub extern fn __lgamma_r(f64, __signgamp: [*c]c_int) f64;
pub extern fn rint(__x: f64) f64;
pub extern fn __rint(__x: f64) f64;
pub extern fn nextafter(__x: f64, __y: f64) f64;
pub extern fn __nextafter(__x: f64, __y: f64) f64;
pub extern fn nexttoward(__x: f64, __y: c_longdouble) f64;
pub extern fn __nexttoward(__x: f64, __y: c_longdouble) f64;
pub extern fn remainder(__x: f64, __y: f64) f64;
pub extern fn __remainder(__x: f64, __y: f64) f64;
pub extern fn scalbn(__x: f64, __n: c_int) f64;
pub extern fn __scalbn(__x: f64, __n: c_int) f64;
pub extern fn ilogb(__x: f64) c_int;
pub extern fn __ilogb(__x: f64) c_int;
pub extern fn scalbln(__x: f64, __n: c_long) f64;
pub extern fn __scalbln(__x: f64, __n: c_long) f64;
pub extern fn nearbyint(__x: f64) f64;
pub extern fn __nearbyint(__x: f64) f64;
pub extern fn round(__x: f64) f64;
pub extern fn __round(__x: f64) f64;
pub extern fn trunc(__x: f64) f64;
pub extern fn __trunc(__x: f64) f64;
pub extern fn remquo(__x: f64, __y: f64, __quo: [*c]c_int) f64;
pub extern fn __remquo(__x: f64, __y: f64, __quo: [*c]c_int) f64;
pub extern fn lrint(__x: f64) c_long;
pub extern fn __lrint(__x: f64) c_long;
pub extern fn llrint(__x: f64) c_longlong;
pub extern fn __llrint(__x: f64) c_longlong;
pub extern fn lround(__x: f64) c_long;
pub extern fn __lround(__x: f64) c_long;
pub extern fn llround(__x: f64) c_longlong;
pub extern fn __llround(__x: f64) c_longlong;
pub extern fn fdim(__x: f64, __y: f64) f64;
pub extern fn __fdim(__x: f64, __y: f64) f64;
pub extern fn fmax(__x: f64, __y: f64) f64;
pub extern fn __fmax(__x: f64, __y: f64) f64;
pub extern fn fmin(__x: f64, __y: f64) f64;
pub extern fn __fmin(__x: f64, __y: f64) f64;
pub extern fn fma(__x: f64, __y: f64, __z: f64) f64;
pub extern fn __fma(__x: f64, __y: f64, __z: f64) f64;
pub extern fn scalb(__x: f64, __n: f64) f64;
pub extern fn __scalb(__x: f64, __n: f64) f64;
pub extern fn __fpclassifyf(__value: f32) c_int;
pub extern fn __signbitf(__value: f32) c_int;
pub extern fn __isinff(__value: f32) c_int;
pub extern fn __finitef(__value: f32) c_int;
pub extern fn __isnanf(__value: f32) c_int;
pub extern fn __iseqsigf(__x: f32, __y: f32) c_int;
pub extern fn __issignalingf(__value: f32) c_int;
pub extern fn acosf(__x: f32) f32;
pub extern fn __acosf(__x: f32) f32;
pub extern fn asinf(__x: f32) f32;
pub extern fn __asinf(__x: f32) f32;
pub extern fn atanf(__x: f32) f32;
pub extern fn __atanf(__x: f32) f32;
pub extern fn atan2f(__y: f32, __x: f32) f32;
pub extern fn __atan2f(__y: f32, __x: f32) f32;
pub extern fn cosf(__x: f32) f32;
pub extern fn __cosf(__x: f32) f32;
pub extern fn sinf(__x: f32) f32;
pub extern fn __sinf(__x: f32) f32;
pub extern fn tanf(__x: f32) f32;
pub extern fn __tanf(__x: f32) f32;
pub extern fn coshf(__x: f32) f32;
pub extern fn __coshf(__x: f32) f32;
pub extern fn sinhf(__x: f32) f32;
pub extern fn __sinhf(__x: f32) f32;
pub extern fn tanhf(__x: f32) f32;
pub extern fn __tanhf(__x: f32) f32;
pub extern fn acoshf(__x: f32) f32;
pub extern fn __acoshf(__x: f32) f32;
pub extern fn asinhf(__x: f32) f32;
pub extern fn __asinhf(__x: f32) f32;
pub extern fn atanhf(__x: f32) f32;
pub extern fn __atanhf(__x: f32) f32;
pub extern fn expf(__x: f32) f32;
pub extern fn __expf(__x: f32) f32;
pub extern fn frexpf(__x: f32, __exponent: [*c]c_int) f32;
pub extern fn __frexpf(__x: f32, __exponent: [*c]c_int) f32;
pub extern fn ldexpf(__x: f32, __exponent: c_int) f32;
pub extern fn __ldexpf(__x: f32, __exponent: c_int) f32;
pub extern fn logf(__x: f32) f32;
pub extern fn __logf(__x: f32) f32;
pub extern fn log10f(__x: f32) f32;
pub extern fn __log10f(__x: f32) f32;
pub extern fn modff(__x: f32, __iptr: [*c]f32) f32;
pub extern fn __modff(__x: f32, __iptr: [*c]f32) f32;
pub extern fn expm1f(__x: f32) f32;
pub extern fn __expm1f(__x: f32) f32;
pub extern fn log1pf(__x: f32) f32;
pub extern fn __log1pf(__x: f32) f32;
pub extern fn logbf(__x: f32) f32;
pub extern fn __logbf(__x: f32) f32;
pub extern fn exp2f(__x: f32) f32;
pub extern fn __exp2f(__x: f32) f32;
pub extern fn log2f(__x: f32) f32;
pub extern fn __log2f(__x: f32) f32;
pub extern fn powf(__x: f32, __y: f32) f32;
pub extern fn __powf(__x: f32, __y: f32) f32;
pub extern fn sqrtf(__x: f32) f32;
pub extern fn __sqrtf(__x: f32) f32;
pub extern fn hypotf(__x: f32, __y: f32) f32;
pub extern fn __hypotf(__x: f32, __y: f32) f32;
pub extern fn cbrtf(__x: f32) f32;
pub extern fn __cbrtf(__x: f32) f32;
pub extern fn ceilf(__x: f32) f32;
pub extern fn __ceilf(__x: f32) f32;
pub extern fn fabsf(__x: f32) f32;
pub extern fn __fabsf(__x: f32) f32;
pub extern fn floorf(__x: f32) f32;
pub extern fn __floorf(__x: f32) f32;
pub extern fn fmodf(__x: f32, __y: f32) f32;
pub extern fn __fmodf(__x: f32, __y: f32) f32;
pub extern fn isinff(__value: f32) c_int;
pub extern fn finitef(__value: f32) c_int;
pub extern fn dremf(__x: f32, __y: f32) f32;
pub extern fn __dremf(__x: f32, __y: f32) f32;
pub extern fn significandf(__x: f32) f32;
pub extern fn __significandf(__x: f32) f32;
pub extern fn copysignf(__x: f32, __y: f32) f32;
pub extern fn __copysignf(__x: f32, __y: f32) f32;
pub extern fn nanf(__tagb: [*c]const u8) f32;
pub extern fn __nanf(__tagb: [*c]const u8) f32;
pub extern fn isnanf(__value: f32) c_int;
pub extern fn j0f(f32) f32;
pub extern fn __j0f(f32) f32;
pub extern fn j1f(f32) f32;
pub extern fn __j1f(f32) f32;
pub extern fn jnf(c_int, f32) f32;
pub extern fn __jnf(c_int, f32) f32;
pub extern fn y0f(f32) f32;
pub extern fn __y0f(f32) f32;
pub extern fn y1f(f32) f32;
pub extern fn __y1f(f32) f32;
pub extern fn ynf(c_int, f32) f32;
pub extern fn __ynf(c_int, f32) f32;
pub extern fn erff(f32) f32;
pub extern fn __erff(f32) f32;
pub extern fn erfcf(f32) f32;
pub extern fn __erfcf(f32) f32;
pub extern fn lgammaf(f32) f32;
pub extern fn __lgammaf(f32) f32;
pub extern fn tgammaf(f32) f32;
pub extern fn __tgammaf(f32) f32;
pub extern fn gammaf(f32) f32;
pub extern fn __gammaf(f32) f32;
pub extern fn lgammaf_r(f32, __signgamp: [*c]c_int) f32;
pub extern fn __lgammaf_r(f32, __signgamp: [*c]c_int) f32;
pub extern fn rintf(__x: f32) f32;
pub extern fn __rintf(__x: f32) f32;
pub extern fn nextafterf(__x: f32, __y: f32) f32;
pub extern fn __nextafterf(__x: f32, __y: f32) f32;
pub extern fn nexttowardf(__x: f32, __y: c_longdouble) f32;
pub extern fn __nexttowardf(__x: f32, __y: c_longdouble) f32;
pub extern fn remainderf(__x: f32, __y: f32) f32;
pub extern fn __remainderf(__x: f32, __y: f32) f32;
pub extern fn scalbnf(__x: f32, __n: c_int) f32;
pub extern fn __scalbnf(__x: f32, __n: c_int) f32;
pub extern fn ilogbf(__x: f32) c_int;
pub extern fn __ilogbf(__x: f32) c_int;
pub extern fn scalblnf(__x: f32, __n: c_long) f32;
pub extern fn __scalblnf(__x: f32, __n: c_long) f32;
pub extern fn nearbyintf(__x: f32) f32;
pub extern fn __nearbyintf(__x: f32) f32;
pub extern fn roundf(__x: f32) f32;
pub extern fn __roundf(__x: f32) f32;
pub extern fn truncf(__x: f32) f32;
pub extern fn __truncf(__x: f32) f32;
pub extern fn remquof(__x: f32, __y: f32, __quo: [*c]c_int) f32;
pub extern fn __remquof(__x: f32, __y: f32, __quo: [*c]c_int) f32;
pub extern fn lrintf(__x: f32) c_long;
pub extern fn __lrintf(__x: f32) c_long;
pub extern fn llrintf(__x: f32) c_longlong;
pub extern fn __llrintf(__x: f32) c_longlong;
pub extern fn lroundf(__x: f32) c_long;
pub extern fn __lroundf(__x: f32) c_long;
pub extern fn llroundf(__x: f32) c_longlong;
pub extern fn __llroundf(__x: f32) c_longlong;
pub extern fn fdimf(__x: f32, __y: f32) f32;
pub extern fn __fdimf(__x: f32, __y: f32) f32;
pub extern fn fmaxf(__x: f32, __y: f32) f32;
pub extern fn __fmaxf(__x: f32, __y: f32) f32;
pub extern fn fminf(__x: f32, __y: f32) f32;
pub extern fn __fminf(__x: f32, __y: f32) f32;
pub extern fn fmaf(__x: f32, __y: f32, __z: f32) f32;
pub extern fn __fmaf(__x: f32, __y: f32, __z: f32) f32;
pub extern fn scalbf(__x: f32, __n: f32) f32;
pub extern fn __scalbf(__x: f32, __n: f32) f32;
pub extern fn __fpclassifyl(__value: c_longdouble) c_int;
pub extern fn __signbitl(__value: c_longdouble) c_int;
pub extern fn __isinfl(__value: c_longdouble) c_int;
pub extern fn __finitel(__value: c_longdouble) c_int;
pub extern fn __isnanl(__value: c_longdouble) c_int;
pub extern fn __iseqsigl(__x: c_longdouble, __y: c_longdouble) c_int;
pub extern fn __issignalingl(__value: c_longdouble) c_int;
pub extern fn acosl(__x: c_longdouble) c_longdouble;
pub extern fn __acosl(__x: c_longdouble) c_longdouble;
pub extern fn asinl(__x: c_longdouble) c_longdouble;
pub extern fn __asinl(__x: c_longdouble) c_longdouble;
pub extern fn atanl(__x: c_longdouble) c_longdouble;
pub extern fn __atanl(__x: c_longdouble) c_longdouble;
pub extern fn atan2l(__y: c_longdouble, __x: c_longdouble) c_longdouble;
pub extern fn __atan2l(__y: c_longdouble, __x: c_longdouble) c_longdouble;
pub extern fn cosl(__x: c_longdouble) c_longdouble;
pub extern fn __cosl(__x: c_longdouble) c_longdouble;
pub extern fn sinl(__x: c_longdouble) c_longdouble;
pub extern fn __sinl(__x: c_longdouble) c_longdouble;
pub extern fn tanl(__x: c_longdouble) c_longdouble;
pub extern fn __tanl(__x: c_longdouble) c_longdouble;
pub extern fn coshl(__x: c_longdouble) c_longdouble;
pub extern fn __coshl(__x: c_longdouble) c_longdouble;
pub extern fn sinhl(__x: c_longdouble) c_longdouble;
pub extern fn __sinhl(__x: c_longdouble) c_longdouble;
pub extern fn tanhl(__x: c_longdouble) c_longdouble;
pub extern fn __tanhl(__x: c_longdouble) c_longdouble;
pub extern fn acoshl(__x: c_longdouble) c_longdouble;
pub extern fn __acoshl(__x: c_longdouble) c_longdouble;
pub extern fn asinhl(__x: c_longdouble) c_longdouble;
pub extern fn __asinhl(__x: c_longdouble) c_longdouble;
pub extern fn atanhl(__x: c_longdouble) c_longdouble;
pub extern fn __atanhl(__x: c_longdouble) c_longdouble;
pub extern fn expl(__x: c_longdouble) c_longdouble;
pub extern fn __expl(__x: c_longdouble) c_longdouble;
pub extern fn frexpl(__x: c_longdouble, __exponent: [*c]c_int) c_longdouble;
pub extern fn __frexpl(__x: c_longdouble, __exponent: [*c]c_int) c_longdouble;
pub extern fn ldexpl(__x: c_longdouble, __exponent: c_int) c_longdouble;
pub extern fn __ldexpl(__x: c_longdouble, __exponent: c_int) c_longdouble;
pub extern fn logl(__x: c_longdouble) c_longdouble;
pub extern fn __logl(__x: c_longdouble) c_longdouble;
pub extern fn log10l(__x: c_longdouble) c_longdouble;
pub extern fn __log10l(__x: c_longdouble) c_longdouble;
pub extern fn modfl(__x: c_longdouble, __iptr: [*c]c_longdouble) c_longdouble;
pub extern fn __modfl(__x: c_longdouble, __iptr: [*c]c_longdouble) c_longdouble;
pub extern fn expm1l(__x: c_longdouble) c_longdouble;
pub extern fn __expm1l(__x: c_longdouble) c_longdouble;
pub extern fn log1pl(__x: c_longdouble) c_longdouble;
pub extern fn __log1pl(__x: c_longdouble) c_longdouble;
pub extern fn logbl(__x: c_longdouble) c_longdouble;
pub extern fn __logbl(__x: c_longdouble) c_longdouble;
pub extern fn exp2l(__x: c_longdouble) c_longdouble;
pub extern fn __exp2l(__x: c_longdouble) c_longdouble;
pub extern fn log2l(__x: c_longdouble) c_longdouble;
pub extern fn __log2l(__x: c_longdouble) c_longdouble;
pub extern fn powl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __powl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn sqrtl(__x: c_longdouble) c_longdouble;
pub extern fn __sqrtl(__x: c_longdouble) c_longdouble;
pub extern fn hypotl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __hypotl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn cbrtl(__x: c_longdouble) c_longdouble;
pub extern fn __cbrtl(__x: c_longdouble) c_longdouble;
pub extern fn ceill(__x: c_longdouble) c_longdouble;
pub extern fn __ceill(__x: c_longdouble) c_longdouble;
pub extern fn fabsl(__x: c_longdouble) c_longdouble;
pub extern fn __fabsl(__x: c_longdouble) c_longdouble;
pub extern fn floorl(__x: c_longdouble) c_longdouble;
pub extern fn __floorl(__x: c_longdouble) c_longdouble;
pub extern fn fmodl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fmodl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn isinfl(__value: c_longdouble) c_int;
pub extern fn finitel(__value: c_longdouble) c_int;
pub extern fn dreml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __dreml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn significandl(__x: c_longdouble) c_longdouble;
pub extern fn __significandl(__x: c_longdouble) c_longdouble;
pub extern fn copysignl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __copysignl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn nanl(__tagb: [*c]const u8) c_longdouble;
pub extern fn __nanl(__tagb: [*c]const u8) c_longdouble;
pub extern fn isnanl(__value: c_longdouble) c_int;
pub extern fn j0l(c_longdouble) c_longdouble;
pub extern fn __j0l(c_longdouble) c_longdouble;
pub extern fn j1l(c_longdouble) c_longdouble;
pub extern fn __j1l(c_longdouble) c_longdouble;
pub extern fn jnl(c_int, c_longdouble) c_longdouble;
pub extern fn __jnl(c_int, c_longdouble) c_longdouble;
pub extern fn y0l(c_longdouble) c_longdouble;
pub extern fn __y0l(c_longdouble) c_longdouble;
pub extern fn y1l(c_longdouble) c_longdouble;
pub extern fn __y1l(c_longdouble) c_longdouble;
pub extern fn ynl(c_int, c_longdouble) c_longdouble;
pub extern fn __ynl(c_int, c_longdouble) c_longdouble;
pub extern fn erfl(c_longdouble) c_longdouble;
pub extern fn __erfl(c_longdouble) c_longdouble;
pub extern fn erfcl(c_longdouble) c_longdouble;
pub extern fn __erfcl(c_longdouble) c_longdouble;
pub extern fn lgammal(c_longdouble) c_longdouble;
pub extern fn __lgammal(c_longdouble) c_longdouble;
pub extern fn tgammal(c_longdouble) c_longdouble;
pub extern fn __tgammal(c_longdouble) c_longdouble;
pub extern fn gammal(c_longdouble) c_longdouble;
pub extern fn __gammal(c_longdouble) c_longdouble;
pub extern fn lgammal_r(c_longdouble, __signgamp: [*c]c_int) c_longdouble;
pub extern fn __lgammal_r(c_longdouble, __signgamp: [*c]c_int) c_longdouble;
pub extern fn rintl(__x: c_longdouble) c_longdouble;
pub extern fn __rintl(__x: c_longdouble) c_longdouble;
pub extern fn nextafterl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __nextafterl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn nexttowardl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __nexttowardl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn remainderl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __remainderl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn scalbnl(__x: c_longdouble, __n: c_int) c_longdouble;
pub extern fn __scalbnl(__x: c_longdouble, __n: c_int) c_longdouble;
pub extern fn ilogbl(__x: c_longdouble) c_int;
pub extern fn __ilogbl(__x: c_longdouble) c_int;
pub extern fn scalblnl(__x: c_longdouble, __n: c_long) c_longdouble;
pub extern fn __scalblnl(__x: c_longdouble, __n: c_long) c_longdouble;
pub extern fn nearbyintl(__x: c_longdouble) c_longdouble;
pub extern fn __nearbyintl(__x: c_longdouble) c_longdouble;
pub extern fn roundl(__x: c_longdouble) c_longdouble;
pub extern fn __roundl(__x: c_longdouble) c_longdouble;
pub extern fn truncl(__x: c_longdouble) c_longdouble;
pub extern fn __truncl(__x: c_longdouble) c_longdouble;
pub extern fn remquol(__x: c_longdouble, __y: c_longdouble, __quo: [*c]c_int) c_longdouble;
pub extern fn __remquol(__x: c_longdouble, __y: c_longdouble, __quo: [*c]c_int) c_longdouble;
pub extern fn lrintl(__x: c_longdouble) c_long;
pub extern fn __lrintl(__x: c_longdouble) c_long;
pub extern fn llrintl(__x: c_longdouble) c_longlong;
pub extern fn __llrintl(__x: c_longdouble) c_longlong;
pub extern fn lroundl(__x: c_longdouble) c_long;
pub extern fn __lroundl(__x: c_longdouble) c_long;
pub extern fn llroundl(__x: c_longdouble) c_longlong;
pub extern fn __llroundl(__x: c_longdouble) c_longlong;
pub extern fn fdiml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fdiml(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn fmaxl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fmaxl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn fminl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn __fminl(__x: c_longdouble, __y: c_longdouble) c_longdouble;
pub extern fn fmal(__x: c_longdouble, __y: c_longdouble, __z: c_longdouble) c_longdouble;
pub extern fn __fmal(__x: c_longdouble, __y: c_longdouble, __z: c_longdouble) c_longdouble;
pub extern fn scalbl(__x: c_longdouble, __n: c_longdouble) c_longdouble;
pub extern fn __scalbl(__x: c_longdouble, __n: c_longdouble) c_longdouble;
pub extern var signgam: c_int;
pub const FP_NAN: c_int = 0;
pub const FP_INFINITE: c_int = 1;
pub const FP_ZERO: c_int = 2;
pub const FP_SUBNORMAL: c_int = 3;
pub const FP_NORMAL: c_int = 4;
const enum_unnamed_3 = c_uint;
pub var stbi__flip_vertically_on_write: c_int = 0;
pub const stbi__write_context = extern struct {
    func: ?*const stbi_write_func,
    context: ?*anyopaque,
    buffer: [64]u8,
    buf_used: c_int,
};
pub fn stbi__start_write_callbacks(arg_s: [*c]stbi__write_context, arg_c: ?*const stbi_write_func, arg_context: ?*anyopaque) callconv(.C) void {
    var s = arg_s;
    var c = arg_c;
    var context = arg_context;
    s.*.func = c;
    s.*.context = context;
}
pub fn stbi__stdio_write(arg_context: ?*anyopaque, arg_data: ?*anyopaque, arg_size: c_int) callconv(.C) void {
    var context = arg_context;
    var data = arg_data;
    var size = arg_size;
    _ = fwrite(data, @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))), @as(c_ulong, @bitCast(@as(c_long, size))), @as([*c]FILE, @ptrCast(@alignCast(context))));
}
pub fn stbiw__fopen(arg_filename: [*c]const u8, arg_mode: [*c]const u8) callconv(.C) [*c]FILE {
    var filename = arg_filename;
    var mode = arg_mode;
    var f: [*c]FILE = undefined;
    f = fopen(filename, mode);
    return f;
}
pub fn stbi__start_write_file(arg_s: [*c]stbi__write_context, arg_filename: [*c]const u8) callconv(.C) c_int {
    var s = arg_s;
    var filename = arg_filename;
    var f: [*c]FILE = stbiw__fopen(filename, "wb");
    stbi__start_write_callbacks(s, &stbi__stdio_write, @as(?*anyopaque, @ptrCast(f)));
    return @intFromBool(f != @as([*c]FILE, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))));
}
pub fn stbi__end_write_file(arg_s: [*c]stbi__write_context) callconv(.C) void {
    var s = arg_s;
    _ = fclose(@as([*c]FILE, @ptrCast(@alignCast(s.*.context))));
}
pub const stbiw_uint32 = c_uint;
pub const stb_image_write_test = [1]c_int; // /home/calion/Downloads/lib/include/stdarg.h:36:29: warning: unsupported stmt class VAArgExprClass
// /home/calion/Desktop/Aslion/src/stb_image_write.h:339:13: warning: unable to translate function, demoted to extern
pub extern fn stbiw__writefv(arg_s: [*c]stbi__write_context, arg_fmt: [*c]const u8, arg_v: [*c]struct___va_list_tag) callconv(.C) void; // /home/calion/Desktop/Aslion/src/stb_image_write.h:368:13: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn stbiw__writef(s: [*c]stbi__write_context, fmt: [*c]const u8, ...) void;
pub fn stbiw__write_flush(arg_s: [*c]stbi__write_context) callconv(.C) void {
    var s = arg_s;
    if (s.*.buf_used != 0) {
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(&s.*.buffer)), s.*.buf_used);
        s.*.buf_used = 0;
    }
}
pub fn stbiw__putc(arg_s: [*c]stbi__write_context, arg_c: u8) callconv(.C) void {
    var s = arg_s;
    var c = arg_c;
    s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(&c)), @as(c_int, 1));
}
pub fn stbiw__write1(arg_s: [*c]stbi__write_context, arg_a: u8) callconv(.C) void {
    var s = arg_s;
    var a = arg_a;
    if ((@as(usize, @bitCast(@as(c_long, s.*.buf_used))) +% @as(usize, @bitCast(@as(c_long, @as(c_int, 1))))) > @sizeOf([64]u8)) {
        stbiw__write_flush(s);
    }
    s.*.buffer[@as(c_uint, @intCast(blk: {
            const ref = &s.*.buf_used;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }))] = a;
}
pub fn stbiw__write3(arg_s: [*c]stbi__write_context, arg_a: u8, arg_b: u8, arg_c: u8) callconv(.C) void {
    var s = arg_s;
    var a = arg_a;
    var b = arg_b;
    var c = arg_c;
    var n: c_int = undefined;
    if ((@as(usize, @bitCast(@as(c_long, s.*.buf_used))) +% @as(usize, @bitCast(@as(c_long, @as(c_int, 3))))) > @sizeOf([64]u8)) {
        stbiw__write_flush(s);
    }
    n = s.*.buf_used;
    s.*.buf_used = n + @as(c_int, 3);
    s.*.buffer[@as(c_uint, @intCast(n + @as(c_int, 0)))] = a;
    s.*.buffer[@as(c_uint, @intCast(n + @as(c_int, 1)))] = b;
    s.*.buffer[@as(c_uint, @intCast(n + @as(c_int, 2)))] = c;
}
pub fn stbiw__write_pixel(arg_s: [*c]stbi__write_context, arg_rgb_dir: c_int, arg_comp: c_int, arg_write_alpha: c_int, arg_expand_mono: c_int, arg_d: [*c]u8) callconv(.C) void {
    var s = arg_s;
    var rgb_dir = arg_rgb_dir;
    var comp = arg_comp;
    var write_alpha = arg_write_alpha;
    var expand_mono = arg_expand_mono;
    var d = arg_d;
    var bg: [3]u8 = [3]u8{
        255,
        0,
        255,
    };
    var px: [3]u8 = undefined;
    var k: c_int = undefined;
    if (write_alpha < @as(c_int, 0)) {
        stbiw__write1(s, (blk: {
            const tmp = comp - @as(c_int, 1);
            if (tmp >= 0) break :blk d + @as(usize, @intCast(tmp)) else break :blk d - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).*);
    }
    while (true) {
        switch (comp) {
            @as(c_int, 2), @as(c_int, 1) => {
                if (expand_mono != 0) {
                    stbiw__write3(s, d[@as(c_uint, @intCast(@as(c_int, 0)))], d[@as(c_uint, @intCast(@as(c_int, 0)))], d[@as(c_uint, @intCast(@as(c_int, 0)))]);
                } else {
                    stbiw__write1(s, d[@as(c_uint, @intCast(@as(c_int, 0)))]);
                }
                break;
            },
            @as(c_int, 4) => {
                if (!(write_alpha != 0)) {
                    {
                        k = 0;
                        while (k < @as(c_int, 3)) : (k += 1) {
                            px[@as(c_uint, @intCast(k))] = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, bg[@as(c_uint, @intCast(k))]))) + @divTrunc((@as(c_int, @bitCast(@as(c_uint, (blk: {
                                const tmp = k;
                                if (tmp >= 0) break :blk d + @as(usize, @intCast(tmp)) else break :blk d - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*))) - @as(c_int, @bitCast(@as(c_uint, bg[@as(c_uint, @intCast(k))])))) * @as(c_int, @bitCast(@as(c_uint, d[@as(c_uint, @intCast(@as(c_int, 3)))]))), @as(c_int, 255))))));
                        }
                    }
                    stbiw__write3(s, px[@as(c_uint, @intCast(@as(c_int, 1) - rgb_dir))], px[@as(c_uint, @intCast(@as(c_int, 1)))], px[@as(c_uint, @intCast(@as(c_int, 1) + rgb_dir))]);
                    break;
                }
                stbiw__write3(s, (blk: {
                    const tmp = @as(c_int, 1) - rgb_dir;
                    if (tmp >= 0) break :blk d + @as(usize, @intCast(tmp)) else break :blk d - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*, d[@as(c_uint, @intCast(@as(c_int, 1)))], (blk: {
                    const tmp = @as(c_int, 1) + rgb_dir;
                    if (tmp >= 0) break :blk d + @as(usize, @intCast(tmp)) else break :blk d - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*);
                break;
            },
            @as(c_int, 3) => {
                stbiw__write3(s, (blk: {
                    const tmp = @as(c_int, 1) - rgb_dir;
                    if (tmp >= 0) break :blk d + @as(usize, @intCast(tmp)) else break :blk d - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*, d[@as(c_uint, @intCast(@as(c_int, 1)))], (blk: {
                    const tmp = @as(c_int, 1) + rgb_dir;
                    if (tmp >= 0) break :blk d + @as(usize, @intCast(tmp)) else break :blk d - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*);
                break;
            },
            else => {},
        }
        break;
    }
    if (write_alpha > @as(c_int, 0)) {
        stbiw__write1(s, (blk: {
            const tmp = comp - @as(c_int, 1);
            if (tmp >= 0) break :blk d + @as(usize, @intCast(tmp)) else break :blk d - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).*);
    }
}
pub fn stbiw__write_pixels(arg_s: [*c]stbi__write_context, arg_rgb_dir: c_int, arg_vdir: c_int, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*anyopaque, arg_write_alpha: c_int, arg_scanline_pad: c_int, arg_expand_mono: c_int) callconv(.C) void {
    var s = arg_s;
    var rgb_dir = arg_rgb_dir;
    var vdir = arg_vdir;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var write_alpha = arg_write_alpha;
    var scanline_pad = arg_scanline_pad;
    var expand_mono = arg_expand_mono;
    var zero: stbiw_uint32 = 0;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var j_end: c_int = undefined;
    if (y <= @as(c_int, 0)) return;
    if (stbi__flip_vertically_on_write != 0) {
        vdir *= -@as(c_int, 1);
    }
    if (vdir < @as(c_int, 0)) {
        j_end = -@as(c_int, 1);
        j = y - @as(c_int, 1);
    } else {
        j_end = y;
        j = 0;
    }
    while (j != j_end) : (j += vdir) {
        {
            i = 0;
            while (i < x) : (i += 1) {
                var d: [*c]u8 = @as([*c]u8, @ptrCast(@alignCast(data))) + @as(usize, @bitCast(@as(isize, @intCast(((j * x) + i) * comp))));
                stbiw__write_pixel(s, rgb_dir, comp, write_alpha, expand_mono, d);
            }
        }
        stbiw__write_flush(s);
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(&zero)), scanline_pad);
    }
} // /home/calion/Desktop/Aslion/src/stb_image_write.h:468:12: warning: TODO unable to translate variadic function, demoted to extern
pub extern fn stbiw__outfile(s: [*c]stbi__write_context, rgb_dir: c_int, vdir: c_int, x: c_int, y: c_int, comp: c_int, expand_mono: c_int, data: ?*anyopaque, alpha: c_int, pad: c_int, fmt: [*c]const u8, ...) c_int;
pub fn stbi_write_bmp_core(arg_s: [*c]stbi__write_context, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*const anyopaque) callconv(.C) c_int {
    var s = arg_s;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    if (comp != @as(c_int, 4)) {
        var pad: c_int = (-x * @as(c_int, 3)) & @as(c_int, 3);
        return stbiw__outfile(s, -@as(c_int, 1), -@as(c_int, 1), x, y, comp, @as(c_int, 1), @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(data)))), @as(c_int, 0), pad, "11 4 22 44 44 22 444444", @as(c_int, 'B'), @as(c_int, 'M'), (@as(c_int, 14) + @as(c_int, 40)) + (((x * @as(c_int, 3)) + pad) * y), @as(c_int, 0), @as(c_int, 0), @as(c_int, 14) + @as(c_int, 40), @as(c_int, 40), x, y, @as(c_int, 1), @as(c_int, 24), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0));
    } else {
        return stbiw__outfile(s, -@as(c_int, 1), -@as(c_int, 1), x, y, comp, @as(c_int, 1), @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(data)))), @as(c_int, 1), @as(c_int, 0), "11 4 22 44 44 22 444444 4444 4 444 444 444 444", @as(c_int, 'B'), @as(c_int, 'M'), (@as(c_int, 14) + @as(c_int, 108)) + ((x * y) * @as(c_int, 4)), @as(c_int, 0), @as(c_int, 0), @as(c_int, 14) + @as(c_int, 108), @as(c_int, 108), x, y, @as(c_int, 1), @as(c_int, 32), @as(c_int, 3), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 16711680), @as(c_int, 65280), @as(c_int, 255), @as(c_uint, 4278190080), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0));
    }
    return 0;
}
pub fn stbi_write_tga_core(arg_s: [*c]stbi__write_context, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: ?*anyopaque) callconv(.C) c_int {
    var s = arg_s;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    var has_alpha: c_int = @intFromBool((comp == @as(c_int, 2)) or (comp == @as(c_int, 4)));
    var colorbytes: c_int = if (has_alpha != 0) comp - @as(c_int, 1) else comp;
    var format: c_int = if (colorbytes < @as(c_int, 2)) @as(c_int, 3) else @as(c_int, 2);
    if ((y < @as(c_int, 0)) or (x < @as(c_int, 0))) return 0;
    if (!(stbi_write_tga_with_rle != 0)) {
        return stbiw__outfile(s, -@as(c_int, 1), -@as(c_int, 1), x, y, comp, @as(c_int, 0), data, has_alpha, @as(c_int, 0), "111 221 2222 11", @as(c_int, 0), @as(c_int, 0), format, @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), x, y, (colorbytes + has_alpha) * @as(c_int, 8), has_alpha * @as(c_int, 8));
    } else {
        var i: c_int = undefined;
        var j: c_int = undefined;
        var k: c_int = undefined;
        var jend: c_int = undefined;
        var jdir: c_int = undefined;
        stbiw__writef(s, "111 221 2222 11", @as(c_int, 0), @as(c_int, 0), format + @as(c_int, 8), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), x, y, (colorbytes + has_alpha) * @as(c_int, 8), has_alpha * @as(c_int, 8));
        if (stbi__flip_vertically_on_write != 0) {
            j = 0;
            jend = y;
            jdir = 1;
        } else {
            j = y - @as(c_int, 1);
            jend = -@as(c_int, 1);
            jdir = -@as(c_int, 1);
        }
        while (j != jend) : (j += jdir) {
            var row: [*c]u8 = @as([*c]u8, @ptrCast(@alignCast(data))) + @as(usize, @bitCast(@as(isize, @intCast((j * x) * comp))));
            var len: c_int = undefined;
            {
                i = 0;
                while (i < x) : (i += len) {
                    var begin: [*c]u8 = row + @as(usize, @bitCast(@as(isize, @intCast(i * comp))));
                    var diff: c_int = 1;
                    len = 1;
                    if (i < (x - @as(c_int, 1))) {
                        len += 1;
                        diff = memcmp(@as(?*const anyopaque, @ptrCast(begin)), @as(?*const anyopaque, @ptrCast(row + @as(usize, @bitCast(@as(isize, @intCast((i + @as(c_int, 1)) * comp)))))), @as(c_ulong, @bitCast(@as(c_long, comp))));
                        if (diff != 0) {
                            var prev: [*c]const u8 = begin;
                            {
                                k = i + @as(c_int, 2);
                                while ((k < x) and (len < @as(c_int, 128))) : (k += 1) {
                                    if (memcmp(@as(?*const anyopaque, @ptrCast(prev)), @as(?*const anyopaque, @ptrCast(row + @as(usize, @bitCast(@as(isize, @intCast(k * comp)))))), @as(c_ulong, @bitCast(@as(c_long, comp)))) != 0) {
                                        prev += @as(usize, @bitCast(@as(isize, @intCast(comp))));
                                        len += 1;
                                    } else {
                                        len -= 1;
                                        break;
                                    }
                                }
                            }
                        } else {
                            {
                                k = i + @as(c_int, 2);
                                while ((k < x) and (len < @as(c_int, 128))) : (k += 1) {
                                    if (!(memcmp(@as(?*const anyopaque, @ptrCast(begin)), @as(?*const anyopaque, @ptrCast(row + @as(usize, @bitCast(@as(isize, @intCast(k * comp)))))), @as(c_ulong, @bitCast(@as(c_long, comp)))) != 0)) {
                                        len += 1;
                                    } else {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    if (diff != 0) {
                        var header: u8 = @as(u8, @bitCast(@as(i8, @truncate((len - @as(c_int, 1)) & @as(c_int, 255)))));
                        stbiw__write1(s, header);
                        {
                            k = 0;
                            while (k < len) : (k += 1) {
                                stbiw__write_pixel(s, -@as(c_int, 1), comp, has_alpha, @as(c_int, 0), begin + @as(usize, @bitCast(@as(isize, @intCast(k * comp)))));
                            }
                        }
                    } else {
                        var header: u8 = @as(u8, @bitCast(@as(i8, @truncate((len - @as(c_int, 129)) & @as(c_int, 255)))));
                        stbiw__write1(s, header);
                        stbiw__write_pixel(s, -@as(c_int, 1), comp, has_alpha, @as(c_int, 0), begin);
                    }
                }
            }
        }
        stbiw__write_flush(s);
    }
    return 1;
}
pub fn stbiw__linear_to_rgbe(arg_rgbe: [*c]u8, arg_linear: [*c]f32) callconv(.C) void {
    var rgbe = arg_rgbe;
    var linear = arg_linear;
    var exponent: c_int = undefined;
    var maxcomp: f32 = if (linear[@as(c_uint, @intCast(@as(c_int, 0)))] > (if (linear[@as(c_uint, @intCast(@as(c_int, 1)))] > linear[@as(c_uint, @intCast(@as(c_int, 2)))]) linear[@as(c_uint, @intCast(@as(c_int, 1)))] else linear[@as(c_uint, @intCast(@as(c_int, 2)))])) linear[@as(c_uint, @intCast(@as(c_int, 0)))] else if (linear[@as(c_uint, @intCast(@as(c_int, 1)))] > linear[@as(c_uint, @intCast(@as(c_int, 2)))]) linear[@as(c_uint, @intCast(@as(c_int, 1)))] else linear[@as(c_uint, @intCast(@as(c_int, 2)))];
    if (maxcomp < 0.00000000000000000000000000000001000000023742228) {
        rgbe[@as(c_uint, @intCast(@as(c_int, 0)))] = blk: {
            const tmp = blk_1: {
                const tmp_2 = blk_2: {
                    const tmp_3 = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 0)))));
                    rgbe[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp_3;
                    break :blk_2 tmp_3;
                };
                rgbe[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp_2;
                break :blk_1 tmp_2;
            };
            rgbe[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
            break :blk tmp;
        };
    } else {
        var normalize: f32 = (@as(f32, @floatCast(frexp(@as(f64, @floatCast(maxcomp)), &exponent))) * 256.0) / maxcomp;
        rgbe[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @intFromFloat(linear[@as(c_uint, @intCast(@as(c_int, 0)))] * normalize));
        rgbe[@as(c_uint, @intCast(@as(c_int, 1)))] = @as(u8, @intFromFloat(linear[@as(c_uint, @intCast(@as(c_int, 1)))] * normalize));
        rgbe[@as(c_uint, @intCast(@as(c_int, 2)))] = @as(u8, @intFromFloat(linear[@as(c_uint, @intCast(@as(c_int, 2)))] * normalize));
        rgbe[@as(c_uint, @intCast(@as(c_int, 3)))] = @as(u8, @bitCast(@as(i8, @truncate(exponent + @as(c_int, 128)))));
    }
}
pub fn stbiw__write_run_data(arg_s: [*c]stbi__write_context, arg_length: c_int, arg_databyte: u8) callconv(.C) void {
    var s = arg_s;
    var length = arg_length;
    var databyte = arg_databyte;
    var lengthbyte: u8 = @as(u8, @bitCast(@as(i8, @truncate((length + @as(c_int, 128)) & @as(c_int, 255)))));
    _ = @as(c_int, 0);
    s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(&lengthbyte)), @as(c_int, 1));
    s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(&databyte)), @as(c_int, 1));
}
pub fn stbiw__write_dump_data(arg_s: [*c]stbi__write_context, arg_length: c_int, arg_data: [*c]u8) callconv(.C) void {
    var s = arg_s;
    var length = arg_length;
    var data = arg_data;
    var lengthbyte: u8 = @as(u8, @bitCast(@as(i8, @truncate(length & @as(c_int, 255)))));
    _ = @as(c_int, 0);
    s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(&lengthbyte)), @as(c_int, 1));
    s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(data)), length);
}
pub fn stbiw__write_hdr_scanline(arg_s: [*c]stbi__write_context, arg_width: c_int, arg_ncomp: c_int, arg_scratch: [*c]u8, arg_scanline: [*c]f32) callconv(.C) void {
    var s = arg_s;
    var width = arg_width;
    var ncomp = arg_ncomp;
    var scratch = arg_scratch;
    var scanline = arg_scanline;
    var scanlineheader: [4]u8 = [4]u8{
        2,
        2,
        0,
        0,
    };
    var rgbe: [4]u8 = undefined;
    var linear: [3]f32 = undefined;
    var x: c_int = undefined;
    scanlineheader[@as(c_uint, @intCast(@as(c_int, 2)))] = @as(u8, @bitCast(@as(i8, @truncate((width & @as(c_int, 65280)) >> @intCast(8)))));
    scanlineheader[@as(c_uint, @intCast(@as(c_int, 3)))] = @as(u8, @bitCast(@as(i8, @truncate(width & @as(c_int, 255)))));
    if ((width < @as(c_int, 8)) or (width >= @as(c_int, 32768))) {
        {
            x = 0;
            while (x < width) : (x += 1) {
                while (true) {
                    switch (ncomp) {
                        @as(c_int, 4), @as(c_int, 3) => {
                            linear[@as(c_uint, @intCast(@as(c_int, 2)))] = (blk: {
                                const tmp = (x * ncomp) + @as(c_int, 2);
                                if (tmp >= 0) break :blk scanline + @as(usize, @intCast(tmp)) else break :blk scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*;
                            linear[@as(c_uint, @intCast(@as(c_int, 1)))] = (blk: {
                                const tmp = (x * ncomp) + @as(c_int, 1);
                                if (tmp >= 0) break :blk scanline + @as(usize, @intCast(tmp)) else break :blk scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*;
                            linear[@as(c_uint, @intCast(@as(c_int, 0)))] = (blk: {
                                const tmp = (x * ncomp) + @as(c_int, 0);
                                if (tmp >= 0) break :blk scanline + @as(usize, @intCast(tmp)) else break :blk scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*;
                            break;
                        },
                        else => {
                            linear[@as(c_uint, @intCast(@as(c_int, 0)))] = blk: {
                                const tmp = blk_1: {
                                    const tmp_2 = (blk_2: {
                                        const tmp_3 = (x * ncomp) + @as(c_int, 0);
                                        if (tmp_3 >= 0) break :blk_2 scanline + @as(usize, @intCast(tmp_3)) else break :blk_2 scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                                    }).*;
                                    linear[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp_2;
                                    break :blk_1 tmp_2;
                                };
                                linear[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                                break :blk tmp;
                            };
                            break;
                        },
                    }
                    break;
                }
                stbiw__linear_to_rgbe(@as([*c]u8, @ptrCast(@alignCast(&rgbe))), @as([*c]f32, @ptrCast(@alignCast(&linear))));
                s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@as([*c]u8, @ptrCast(@alignCast(&rgbe))))), @as(c_int, 4));
            }
        }
    } else {
        var c: c_int = undefined;
        var r: c_int = undefined;
        {
            x = 0;
            while (x < width) : (x += 1) {
                while (true) {
                    switch (ncomp) {
                        @as(c_int, 4), @as(c_int, 3) => {
                            linear[@as(c_uint, @intCast(@as(c_int, 2)))] = (blk: {
                                const tmp = (x * ncomp) + @as(c_int, 2);
                                if (tmp >= 0) break :blk scanline + @as(usize, @intCast(tmp)) else break :blk scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*;
                            linear[@as(c_uint, @intCast(@as(c_int, 1)))] = (blk: {
                                const tmp = (x * ncomp) + @as(c_int, 1);
                                if (tmp >= 0) break :blk scanline + @as(usize, @intCast(tmp)) else break :blk scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*;
                            linear[@as(c_uint, @intCast(@as(c_int, 0)))] = (blk: {
                                const tmp = (x * ncomp) + @as(c_int, 0);
                                if (tmp >= 0) break :blk scanline + @as(usize, @intCast(tmp)) else break :blk scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*;
                            break;
                        },
                        else => {
                            linear[@as(c_uint, @intCast(@as(c_int, 0)))] = blk: {
                                const tmp = blk_1: {
                                    const tmp_2 = (blk_2: {
                                        const tmp_3 = (x * ncomp) + @as(c_int, 0);
                                        if (tmp_3 >= 0) break :blk_2 scanline + @as(usize, @intCast(tmp_3)) else break :blk_2 scanline - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                                    }).*;
                                    linear[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp_2;
                                    break :blk_1 tmp_2;
                                };
                                linear[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                                break :blk tmp;
                            };
                            break;
                        },
                    }
                    break;
                }
                stbiw__linear_to_rgbe(@as([*c]u8, @ptrCast(@alignCast(&rgbe))), @as([*c]f32, @ptrCast(@alignCast(&linear))));
                (blk: {
                    const tmp = x + (width * @as(c_int, 0));
                    if (tmp >= 0) break :blk scratch + @as(usize, @intCast(tmp)) else break :blk scratch - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).* = rgbe[@as(c_uint, @intCast(@as(c_int, 0)))];
                (blk: {
                    const tmp = x + (width * @as(c_int, 1));
                    if (tmp >= 0) break :blk scratch + @as(usize, @intCast(tmp)) else break :blk scratch - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).* = rgbe[@as(c_uint, @intCast(@as(c_int, 1)))];
                (blk: {
                    const tmp = x + (width * @as(c_int, 2));
                    if (tmp >= 0) break :blk scratch + @as(usize, @intCast(tmp)) else break :blk scratch - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).* = rgbe[@as(c_uint, @intCast(@as(c_int, 2)))];
                (blk: {
                    const tmp = x + (width * @as(c_int, 3));
                    if (tmp >= 0) break :blk scratch + @as(usize, @intCast(tmp)) else break :blk scratch - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).* = rgbe[@as(c_uint, @intCast(@as(c_int, 3)))];
            }
        }
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@as([*c]u8, @ptrCast(@alignCast(&scanlineheader))))), @as(c_int, 4));
        {
            c = 0;
            while (c < @as(c_int, 4)) : (c += 1) {
                var comp: [*c]u8 = &(blk: {
                    const tmp = width * c;
                    if (tmp >= 0) break :blk scratch + @as(usize, @intCast(tmp)) else break :blk scratch - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*;
                x = 0;
                while (x < width) {
                    r = x;
                    while ((r + @as(c_int, 2)) < width) {
                        if ((@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = r;
                            if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) == @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = r + @as(c_int, 1);
                            if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*)))) and (@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = r;
                            if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) == @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = r + @as(c_int, 2);
                            if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))))) break;
                        r += 1;
                    }
                    if ((r + @as(c_int, 2)) >= width) {
                        r = width;
                    }
                    while (x < r) {
                        var len: c_int = r - x;
                        if (len > @as(c_int, 128)) {
                            len = 128;
                        }
                        stbiw__write_dump_data(s, len, &(blk: {
                            const tmp = x;
                            if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*);
                        x += len;
                    }
                    if ((r + @as(c_int, 2)) < width) {
                        while ((r < width) and (@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = r;
                            if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) == @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = x;
                            if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))))) {
                            r += 1;
                        }
                        while (x < r) {
                            var len: c_int = r - x;
                            if (len > @as(c_int, 127)) {
                                len = 127;
                            }
                            stbiw__write_run_data(s, len, (blk: {
                                const tmp = x;
                                if (tmp >= 0) break :blk comp + @as(usize, @intCast(tmp)) else break :blk comp - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                            }).*);
                            x += len;
                        }
                    }
                }
            }
        }
    }
}
pub fn stbi_write_hdr_core(arg_s: [*c]stbi__write_context, arg_x: c_int, arg_y: c_int, arg_comp: c_int, arg_data: [*c]f32) callconv(.C) c_int {
    var s = arg_s;
    var x = arg_x;
    var y = arg_y;
    var comp = arg_comp;
    var data = arg_data;
    if (((y <= @as(c_int, 0)) or (x <= @as(c_int, 0))) or (data == @as([*c]f32, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))))) return 0 else {
        var scratch: [*c]u8 = @as([*c]u8, @ptrCast(@alignCast(malloc(@as(c_ulong, @bitCast(@as(c_long, x * @as(c_int, 4))))))));
        var i: c_int = undefined;
        var len: c_int = undefined;
        var buffer: [128]u8 = undefined;
        var header: [65:0]u8 = "#?RADIANCE\n# Written by stb_image_write.h\nFORMAT=32-bit_rle_rgbe\n".*;
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@as([*c]u8, @ptrCast(@alignCast(&header))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([66]u8) -% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))))))));
        len = sprintf(@as([*c]u8, @ptrCast(@alignCast(&buffer))), "EXPOSURE=          1.0000000000000\n\n-Y %d +X %d\n", y, x);
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@as([*c]u8, @ptrCast(@alignCast(&buffer))))), len);
        {
            i = 0;
            while (i < y) : (i += 1) {
                stbiw__write_hdr_scanline(s, x, comp, scratch, data + @as(usize, @bitCast(@as(isize, @intCast((comp * x) * (if (stbi__flip_vertically_on_write != 0) (y - @as(c_int, 1)) - i else i))))));
            }
        }
        free(@as(?*anyopaque, @ptrCast(scratch)));
        return 1;
    }
    return 0;
}
pub fn stbiw__sbgrowf(arg_arr: [*c]?*anyopaque, arg_increment: c_int, arg_itemsize: c_int) callconv(.C) ?*anyopaque {
    var arr = arg_arr;
    var increment = arg_increment;
    var itemsize = arg_itemsize;
    var m: c_int = if (arr.* != null) (@as(c_int, 2) * (@as([*c]c_int, @ptrCast(@alignCast(arr.*))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))]) + increment else increment + @as(c_int, 1);
    var p: ?*anyopaque = realloc(@as(?*anyopaque, @ptrCast(if (arr.* != null) @as([*c]c_int, @ptrCast(@alignCast(arr.*))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))) else null)), @as(c_ulong, @bitCast(@as(c_long, itemsize * m))) +% (@sizeOf(c_int) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 2))))));
    _ = @as(c_int, 0);
    if (p != null) {
        if (!(arr.* != null)) {
            @as([*c]c_int, @ptrCast(@alignCast(p)))[@as(c_uint, @intCast(@as(c_int, 1)))] = 0;
        }
        arr.* = @as(?*anyopaque, @ptrCast(@as([*c]c_int, @ptrCast(@alignCast(p))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2)))))));
        (@as([*c]c_int, @ptrCast(@alignCast(arr.*))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))] = m;
    }
    return arr.*;
}
pub fn stbiw__zlib_flushf(arg_data: [*c]u8, arg_bitbuffer: [*c]c_uint, arg_bitcount: [*c]c_int) callconv(.C) [*c]u8 {
    var data = arg_data;
    var bitbuffer = arg_bitbuffer;
    var bitcount = arg_bitcount;
    while (bitcount.* >= @as(c_int, 8)) {
        _ = blk: {
            _ = if ((data == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(data))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(data))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&data))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
            break :blk blk_1: {
                const tmp = @as(u8, @bitCast(@as(u8, @truncate(bitbuffer.* & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                (blk_2: {
                    const tmp_3 = blk_3: {
                        const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(data))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                        const tmp_4 = ref.*;
                        ref.* += 1;
                        break :blk_3 tmp_4;
                    };
                    if (tmp_3 >= 0) break :blk_2 data + @as(usize, @intCast(tmp_3)) else break :blk_2 data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                }).* = tmp;
                break :blk_1 tmp;
            };
        };
        bitbuffer.* >>= @intCast(@as(c_int, 8));
        bitcount.* -= @as(c_int, 8);
    }
    return data;
}
pub fn stbiw__zlib_bitrev(arg_code: c_int, arg_codebits: c_int) callconv(.C) c_int {
    var code = arg_code;
    var codebits = arg_codebits;
    var res: c_int = 0;
    while ((blk: {
        const ref = &codebits;
        const tmp = ref.*;
        ref.* -= 1;
        break :blk tmp;
    }) != 0) {
        res = (res << @intCast(1)) | (code & @as(c_int, 1));
        code >>= @intCast(@as(c_int, 1));
    }
    return res;
}
pub fn stbiw__zlib_countm(arg_a: [*c]u8, arg_b: [*c]u8, arg_limit: c_int) callconv(.C) c_uint {
    var a = arg_a;
    var b = arg_b;
    var limit = arg_limit;
    var i: c_int = undefined;
    {
        i = 0;
        while ((i < limit) and (i < @as(c_int, 258))) : (i += 1) if (@as(c_int, @bitCast(@as(c_uint, (blk: {
            const tmp = i;
            if (tmp >= 0) break :blk a + @as(usize, @intCast(tmp)) else break :blk a - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).*))) != @as(c_int, @bitCast(@as(c_uint, (blk: {
            const tmp = i;
            if (tmp >= 0) break :blk b + @as(usize, @intCast(tmp)) else break :blk b - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).*)))) break;
    }
    return @as(c_uint, @bitCast(i));
}
pub fn stbiw__zhash(arg_data: [*c]u8) callconv(.C) c_uint {
    var data = arg_data;
    var hash: stbiw_uint32 = @as(stbiw_uint32, @bitCast((@as(c_int, @bitCast(@as(c_uint, data[@as(c_uint, @intCast(@as(c_int, 0)))]))) + (@as(c_int, @bitCast(@as(c_uint, data[@as(c_uint, @intCast(@as(c_int, 1)))]))) << @intCast(8))) + (@as(c_int, @bitCast(@as(c_uint, data[@as(c_uint, @intCast(@as(c_int, 2)))]))) << @intCast(16))));
    hash ^= hash << @intCast(3);
    hash +%= hash >> @intCast(5);
    hash ^= hash << @intCast(4);
    hash +%= hash >> @intCast(17);
    hash ^= hash << @intCast(25);
    hash +%= hash >> @intCast(6);
    return hash;
}
pub fn stbi_zlib_compress(arg_data: [*c]u8, arg_data_len: c_int, arg_out_len: [*c]c_int, arg_quality: c_int) callconv(.C) [*c]u8 {
    var data = arg_data;
    var data_len = arg_data_len;
    var out_len = arg_out_len;
    var quality = arg_quality;
    const lengthc = struct {
        var static: [30]c_ushort = [30]c_ushort{
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
            13,
            15,
            17,
            19,
            23,
            27,
            31,
            35,
            43,
            51,
            59,
            67,
            83,
            99,
            115,
            131,
            163,
            195,
            227,
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 258))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 259))))),
        };
    };
    const lengtheb = struct {
        var static: [29]u8 = [29]u8{
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            1,
            1,
            1,
            1,
            2,
            2,
            2,
            2,
            3,
            3,
            3,
            3,
            4,
            4,
            4,
            4,
            5,
            5,
            5,
            5,
            0,
        };
    };
    const distc = struct {
        var static: [31]c_ushort = [31]c_ushort{
            1,
            2,
            3,
            4,
            5,
            7,
            9,
            13,
            17,
            25,
            33,
            49,
            65,
            97,
            129,
            193,
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 257))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 385))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 513))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 769))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1025))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1537))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2049))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 3073))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4097))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 6145))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 8193))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 12289))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 16385))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 24577))))),
            @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 32768))))),
        };
    };
    const disteb = struct {
        var static: [30]u8 = [30]u8{
            0,
            0,
            0,
            0,
            1,
            1,
            2,
            2,
            3,
            3,
            4,
            4,
            5,
            5,
            6,
            6,
            7,
            7,
            8,
            8,
            9,
            9,
            10,
            10,
            11,
            11,
            12,
            12,
            13,
            13,
        };
    };
    var bitbuf: c_uint = 0;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var bitcount: c_int = 0;
    var out: [*c]u8 = null;
    var hash_table: [*c][*c][*c]u8 = @as([*c][*c][*c]u8, @ptrCast(@alignCast(malloc(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 16384)))) *% @sizeOf([*c][*c]u8)))));
    if (hash_table == @as([*c][*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) return null;
    if (quality < @as(c_int, 5)) {
        quality = 5;
    }
    _ = blk: {
        _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
        break :blk blk_1: {
            const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 120)))));
            (blk_2: {
                const tmp_3 = blk_3: {
                    const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                    const tmp_4 = ref.*;
                    ref.* += 1;
                    break :blk_3 tmp_4;
                };
                if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
            }).* = tmp;
            break :blk_1 tmp;
        };
    };
    _ = blk: {
        _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
        break :blk blk_1: {
            const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 94)))));
            (blk_2: {
                const tmp_3 = blk_3: {
                    const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                    const tmp_4 = ref.*;
                    ref.* += 1;
                    break :blk_3 tmp_4;
                };
                if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
            }).* = tmp;
            break :blk_1 tmp;
        };
    };
    _ = blk: {
        _ = blk_1: {
            bitbuf |= @as(c_uint, @bitCast(@as(c_int, 1) << @intCast(bitcount)));
            break :blk_1 blk_2: {
                const ref = &bitcount;
                ref.* += @as(c_int, 1);
                break :blk_2 ref.*;
            };
        };
        break :blk blk_1: {
            const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
            out = tmp;
            break :blk_1 tmp;
        };
    };
    _ = blk: {
        _ = blk_1: {
            bitbuf |= @as(c_uint, @bitCast(@as(c_int, 1) << @intCast(bitcount)));
            break :blk_1 blk_2: {
                const ref = &bitcount;
                ref.* += @as(c_int, 2);
                break :blk_2 ref.*;
            };
        };
        break :blk blk_1: {
            const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
            out = tmp;
            break :blk_1 tmp;
        };
    };
    {
        i = 0;
        while (i < @as(c_int, 16384)) : (i += 1) {
            (blk: {
                const tmp = i;
                if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).* = null;
        }
    }
    i = 0;
    while (i < (data_len - @as(c_int, 3))) {
        var h: c_int = @as(c_int, @bitCast(stbiw__zhash(data + @as(usize, @bitCast(@as(isize, @intCast(i))))) & @as(c_uint, @bitCast(@as(c_int, 16384) - @as(c_int, 1)))));
        var best: c_int = 3;
        var bestloc: [*c]u8 = null;
        var hlist: [*c][*c]u8 = (blk: {
            const tmp = h;
            if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).*;
        var n: c_int = if (hlist != null) (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(hlist))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] else @as(c_int, 0);
        {
            j = 0;
            while (j < n) : (j += 1) {
                if (@divExact(@as(c_long, @bitCast(@intFromPtr((blk: {
                    const tmp = j;
                    if (tmp >= 0) break :blk hlist + @as(usize, @intCast(tmp)) else break :blk hlist - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*) -% @intFromPtr(data))), @sizeOf(u8)) > @as(c_long, @bitCast(@as(c_long, i - @as(c_int, 32768))))) {
                    var d: c_int = @as(c_int, @bitCast(stbiw__zlib_countm((blk: {
                        const tmp = j;
                        if (tmp >= 0) break :blk hlist + @as(usize, @intCast(tmp)) else break :blk hlist - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                    }).*, data + @as(usize, @bitCast(@as(isize, @intCast(i)))), data_len - i)));
                    if (d >= best) {
                        best = d;
                        bestloc = (blk: {
                            const tmp = j;
                            if (tmp >= 0) break :blk hlist + @as(usize, @intCast(tmp)) else break :blk hlist - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*;
                    }
                }
            }
        }
        if (((blk: {
            const tmp = h;
            if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).* != null) and ((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast((blk: {
            const tmp = h;
            if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).*))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] == (@as(c_int, 2) * quality))) {
            _ = memmove(@as(?*anyopaque, @ptrCast((blk: {
                const tmp = h;
                if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*)), @as(?*const anyopaque, @ptrCast((blk: {
                const tmp = h;
                if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).* + @as(usize, @bitCast(@as(isize, @intCast(quality)))))), @sizeOf([*c]u8) *% @as(c_ulong, @bitCast(@as(c_long, quality))));
            (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast((blk: {
                const tmp = h;
                if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] = quality;
        }
        _ = blk: {
            _ = if (((blk_1: {
                const tmp = h;
                if (tmp >= 0) break :blk_1 hash_table + @as(usize, @intCast(tmp)) else break :blk_1 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).* == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast((blk_1: {
                const tmp = h;
                if (tmp >= 0) break :blk_1 hash_table + @as(usize, @intCast(tmp)) else break :blk_1 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast((blk_1: {
                const tmp = h;
                if (tmp >= 0) break :blk_1 hash_table + @as(usize, @intCast(tmp)) else break :blk_1 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&(blk_1: {
                const tmp = h;
                if (tmp >= 0) break :blk_1 hash_table + @as(usize, @intCast(tmp)) else break :blk_1 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([*c]u8)))))) else null;
            break :blk blk_1: {
                const tmp = data + @as(usize, @bitCast(@as(isize, @intCast(i))));
                (blk_2: {
                    const tmp_3 = blk_3: {
                        const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast((blk_4: {
                            const tmp_5 = h;
                            if (tmp_5 >= 0) break :blk_4 hash_table + @as(usize, @intCast(tmp_5)) else break :blk_4 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_5)) +% -1));
                        }).*))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                        const tmp_4 = ref.*;
                        ref.* += 1;
                        break :blk_3 tmp_4;
                    };
                    if (tmp_3 >= 0) break :blk_2 (blk_3: {
                        const tmp_4 = h;
                        if (tmp_4 >= 0) break :blk_3 hash_table + @as(usize, @intCast(tmp_4)) else break :blk_3 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_4)) +% -1));
                    }).* + @as(usize, @intCast(tmp_3)) else break :blk_2 (blk_3: {
                        const tmp_4 = h;
                        if (tmp_4 >= 0) break :blk_3 hash_table + @as(usize, @intCast(tmp_4)) else break :blk_3 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_4)) +% -1));
                    }).* - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                }).* = tmp;
                break :blk_1 tmp;
            };
        };
        if (bestloc != null) {
            h = @as(c_int, @bitCast(stbiw__zhash((data + @as(usize, @bitCast(@as(isize, @intCast(i))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))))) & @as(c_uint, @bitCast(@as(c_int, 16384) - @as(c_int, 1)))));
            hlist = (blk: {
                const tmp = h;
                if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*;
            n = if (hlist != null) (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(hlist))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] else @as(c_int, 0);
            {
                j = 0;
                while (j < n) : (j += 1) {
                    if (@divExact(@as(c_long, @bitCast(@intFromPtr((blk: {
                        const tmp = j;
                        if (tmp >= 0) break :blk hlist + @as(usize, @intCast(tmp)) else break :blk hlist - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                    }).*) -% @intFromPtr(data))), @sizeOf(u8)) > @as(c_long, @bitCast(@as(c_long, i - @as(c_int, 32767))))) {
                        var e: c_int = @as(c_int, @bitCast(stbiw__zlib_countm((blk: {
                            const tmp = j;
                            if (tmp >= 0) break :blk hlist + @as(usize, @intCast(tmp)) else break :blk hlist - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*, (data + @as(usize, @bitCast(@as(isize, @intCast(i))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))), (data_len - i) - @as(c_int, 1))));
                        if (e > best) {
                            bestloc = null;
                            break;
                        }
                    }
                }
            }
        }
        if (bestloc != null) {
            var d: c_int = @as(c_int, @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(data + @as(usize, @bitCast(@as(isize, @intCast(i))))) -% @intFromPtr(bestloc))), @sizeOf(u8))))));
            _ = @as(c_int, 0);
            {
                j = 0;
                while (best > (@as(c_int, @bitCast(@as(c_uint, lengthc.static[@as(c_uint, @intCast(j + @as(c_int, 1)))]))) - @as(c_int, 1))) : (j += 1) {}
            }
            _ = if ((j + @as(c_int, 257)) <= @as(c_int, 143)) blk: {
                _ = blk_1: {
                    bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev(@as(c_int, 48) + (j + @as(c_int, 257)), @as(c_int, 8)) << @intCast(bitcount)));
                    break :blk_1 blk_2: {
                        const ref = &bitcount;
                        ref.* += @as(c_int, 8);
                        break :blk_2 ref.*;
                    };
                };
                break :blk blk_1: {
                    const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                    out = tmp;
                    break :blk_1 tmp;
                };
            } else if ((j + @as(c_int, 257)) <= @as(c_int, 255)) blk: {
                _ = blk_1: {
                    bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 400) + (j + @as(c_int, 257))) - @as(c_int, 144), @as(c_int, 9)) << @intCast(bitcount)));
                    break :blk_1 blk_2: {
                        const ref = &bitcount;
                        ref.* += @as(c_int, 9);
                        break :blk_2 ref.*;
                    };
                };
                break :blk blk_1: {
                    const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                    out = tmp;
                    break :blk_1 tmp;
                };
            } else if ((j + @as(c_int, 257)) <= @as(c_int, 279)) blk: {
                _ = blk_1: {
                    bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 0) + (j + @as(c_int, 257))) - @as(c_int, 256), @as(c_int, 7)) << @intCast(bitcount)));
                    break :blk_1 blk_2: {
                        const ref = &bitcount;
                        ref.* += @as(c_int, 7);
                        break :blk_2 ref.*;
                    };
                };
                break :blk blk_1: {
                    const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                    out = tmp;
                    break :blk_1 tmp;
                };
            } else blk: {
                _ = blk_1: {
                    bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 192) + (j + @as(c_int, 257))) - @as(c_int, 280), @as(c_int, 8)) << @intCast(bitcount)));
                    break :blk_1 blk_2: {
                        const ref = &bitcount;
                        ref.* += @as(c_int, 8);
                        break :blk_2 ref.*;
                    };
                };
                break :blk blk_1: {
                    const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                    out = tmp;
                    break :blk_1 tmp;
                };
            };
            if (lengtheb.static[@as(c_uint, @intCast(j))] != 0) {
                _ = blk: {
                    _ = blk_1: {
                        bitbuf |= @as(c_uint, @bitCast((best - @as(c_int, @bitCast(@as(c_uint, lengthc.static[@as(c_uint, @intCast(j))])))) << @intCast(bitcount)));
                        break :blk_1 blk_2: {
                            const ref = &bitcount;
                            ref.* += @as(c_int, @bitCast(@as(c_uint, lengtheb.static[@as(c_uint, @intCast(j))])));
                            break :blk_2 ref.*;
                        };
                    };
                    break :blk blk_1: {
                        const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                        out = tmp;
                        break :blk_1 tmp;
                    };
                };
            }
            {
                j = 0;
                while (d > (@as(c_int, @bitCast(@as(c_uint, distc.static[@as(c_uint, @intCast(j + @as(c_int, 1)))]))) - @as(c_int, 1))) : (j += 1) {}
            }
            _ = blk: {
                _ = blk_1: {
                    bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev(j, @as(c_int, 5)) << @intCast(bitcount)));
                    break :blk_1 blk_2: {
                        const ref = &bitcount;
                        ref.* += @as(c_int, 5);
                        break :blk_2 ref.*;
                    };
                };
                break :blk blk_1: {
                    const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                    out = tmp;
                    break :blk_1 tmp;
                };
            };
            if (disteb.static[@as(c_uint, @intCast(j))] != 0) {
                _ = blk: {
                    _ = blk_1: {
                        bitbuf |= @as(c_uint, @bitCast((d - @as(c_int, @bitCast(@as(c_uint, distc.static[@as(c_uint, @intCast(j))])))) << @intCast(bitcount)));
                        break :blk_1 blk_2: {
                            const ref = &bitcount;
                            ref.* += @as(c_int, @bitCast(@as(c_uint, disteb.static[@as(c_uint, @intCast(j))])));
                            break :blk_2 ref.*;
                        };
                    };
                    break :blk blk_1: {
                        const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                        out = tmp;
                        break :blk_1 tmp;
                    };
                };
            }
            i += best;
        } else {
            _ = if (@as(c_int, @bitCast(@as(c_uint, (blk: {
                const tmp = i;
                if (tmp >= 0) break :blk data + @as(usize, @intCast(tmp)) else break :blk data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*))) <= @as(c_int, 143)) blk: {
                _ = blk_1: {
                    bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev(@as(c_int, 48) + @as(c_int, @bitCast(@as(c_uint, (blk_2: {
                        const tmp = i;
                        if (tmp >= 0) break :blk_2 data + @as(usize, @intCast(tmp)) else break :blk_2 data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                    }).*))), @as(c_int, 8)) << @intCast(bitcount)));
                    break :blk_1 blk_2: {
                        const ref = &bitcount;
                        ref.* += @as(c_int, 8);
                        break :blk_2 ref.*;
                    };
                };
                break :blk blk_1: {
                    const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                    out = tmp;
                    break :blk_1 tmp;
                };
            } else blk: {
                _ = blk_1: {
                    bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 400) + @as(c_int, @bitCast(@as(c_uint, (blk_2: {
                        const tmp = i;
                        if (tmp >= 0) break :blk_2 data + @as(usize, @intCast(tmp)) else break :blk_2 data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                    }).*)))) - @as(c_int, 144), @as(c_int, 9)) << @intCast(bitcount)));
                    break :blk_1 blk_2: {
                        const ref = &bitcount;
                        ref.* += @as(c_int, 9);
                        break :blk_2 ref.*;
                    };
                };
                break :blk blk_1: {
                    const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                    out = tmp;
                    break :blk_1 tmp;
                };
            };
            i += 1;
        }
    }
    while (i < data_len) : (i += 1) {
        _ = if (@as(c_int, @bitCast(@as(c_uint, (blk: {
            const tmp = i;
            if (tmp >= 0) break :blk data + @as(usize, @intCast(tmp)) else break :blk data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
        }).*))) <= @as(c_int, 143)) blk: {
            _ = blk_1: {
                bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev(@as(c_int, 48) + @as(c_int, @bitCast(@as(c_uint, (blk_2: {
                    const tmp = i;
                    if (tmp >= 0) break :blk_2 data + @as(usize, @intCast(tmp)) else break :blk_2 data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*))), @as(c_int, 8)) << @intCast(bitcount)));
                break :blk_1 blk_2: {
                    const ref = &bitcount;
                    ref.* += @as(c_int, 8);
                    break :blk_2 ref.*;
                };
            };
            break :blk blk_1: {
                const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                out = tmp;
                break :blk_1 tmp;
            };
        } else blk: {
            _ = blk_1: {
                bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 400) + @as(c_int, @bitCast(@as(c_uint, (blk_2: {
                    const tmp = i;
                    if (tmp >= 0) break :blk_2 data + @as(usize, @intCast(tmp)) else break :blk_2 data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*)))) - @as(c_int, 144), @as(c_int, 9)) << @intCast(bitcount)));
                break :blk_1 blk_2: {
                    const ref = &bitcount;
                    ref.* += @as(c_int, 9);
                    break :blk_2 ref.*;
                };
            };
            break :blk blk_1: {
                const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                out = tmp;
                break :blk_1 tmp;
            };
        };
    }
    _ = if (@as(c_int, 256) <= @as(c_int, 143)) blk: {
        _ = blk_1: {
            bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev(@as(c_int, 48) + @as(c_int, 256), @as(c_int, 8)) << @intCast(bitcount)));
            break :blk_1 blk_2: {
                const ref = &bitcount;
                ref.* += @as(c_int, 8);
                break :blk_2 ref.*;
            };
        };
        break :blk blk_1: {
            const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
            out = tmp;
            break :blk_1 tmp;
        };
    } else if (@as(c_int, 256) <= @as(c_int, 255)) blk: {
        _ = blk_1: {
            bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 400) + @as(c_int, 256)) - @as(c_int, 144), @as(c_int, 9)) << @intCast(bitcount)));
            break :blk_1 blk_2: {
                const ref = &bitcount;
                ref.* += @as(c_int, 9);
                break :blk_2 ref.*;
            };
        };
        break :blk blk_1: {
            const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
            out = tmp;
            break :blk_1 tmp;
        };
    } else if (@as(c_int, 256) <= @as(c_int, 279)) blk: {
        _ = blk_1: {
            bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 0) + @as(c_int, 256)) - @as(c_int, 256), @as(c_int, 7)) << @intCast(bitcount)));
            break :blk_1 blk_2: {
                const ref = &bitcount;
                ref.* += @as(c_int, 7);
                break :blk_2 ref.*;
            };
        };
        break :blk blk_1: {
            const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
            out = tmp;
            break :blk_1 tmp;
        };
    } else blk: {
        _ = blk_1: {
            bitbuf |= @as(c_uint, @bitCast(stbiw__zlib_bitrev((@as(c_int, 192) + @as(c_int, 256)) - @as(c_int, 280), @as(c_int, 8)) << @intCast(bitcount)));
            break :blk_1 blk_2: {
                const ref = &bitcount;
                ref.* += @as(c_int, 8);
                break :blk_2 ref.*;
            };
        };
        break :blk blk_1: {
            const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
            out = tmp;
            break :blk_1 tmp;
        };
    };
    while (bitcount != 0) {
        _ = blk: {
            _ = blk_1: {
                bitbuf |= @as(c_uint, @bitCast(@as(c_int, 0) << @intCast(bitcount)));
                break :blk_1 blk_2: {
                    const ref = &bitcount;
                    ref.* += @as(c_int, 1);
                    break :blk_2 ref.*;
                };
            };
            break :blk blk_1: {
                const tmp = stbiw__zlib_flushf(out, &bitbuf, &bitcount);
                out = tmp;
                break :blk_1 tmp;
            };
        };
    }
    {
        i = 0;
        while (i < @as(c_int, 16384)) : (i += 1) {
            _ = if ((blk: {
                const tmp = i;
                if (tmp >= 0) break :blk hash_table + @as(usize, @intCast(tmp)) else break :blk hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).* != null) blk: {
                free(@as(?*anyopaque, @ptrCast(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast((blk_1: {
                    const tmp = i;
                    if (tmp >= 0) break :blk_1 hash_table + @as(usize, @intCast(tmp)) else break :blk_1 hash_table - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))));
                break :blk @as(c_int, 0);
            } else @as(c_int, 0);
        }
    }
    free(@as(?*anyopaque, @ptrCast(hash_table)));
    if ((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] > ((data_len + @as(c_int, 2)) + (@divTrunc(data_len + @as(c_int, 32766), @as(c_int, 32767)) * @as(c_int, 5)))) {
        (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] = 2;
        {
            j = 0;
            while (j < data_len) {
                var blocklen: c_int = data_len - j;
                if (blocklen > @as(c_int, 32767)) {
                    blocklen = 32767;
                }
                _ = blk: {
                    _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
                    break :blk blk_1: {
                        const tmp = @as(u8, @intFromBool((data_len - j) == blocklen));
                        (blk_2: {
                            const tmp_3 = blk_3: {
                                const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                                const tmp_4 = ref.*;
                                ref.* += 1;
                                break :blk_3 tmp_4;
                            };
                            if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                        }).* = tmp;
                        break :blk_1 tmp;
                    };
                };
                _ = blk: {
                    _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
                    break :blk blk_1: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate(blocklen & @as(c_int, 255)))));
                        (blk_2: {
                            const tmp_3 = blk_3: {
                                const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                                const tmp_4 = ref.*;
                                ref.* += 1;
                                break :blk_3 tmp_4;
                            };
                            if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                        }).* = tmp;
                        break :blk_1 tmp;
                    };
                };
                _ = blk: {
                    _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
                    break :blk blk_1: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate((blocklen >> @intCast(8)) & @as(c_int, 255)))));
                        (blk_2: {
                            const tmp_3 = blk_3: {
                                const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                                const tmp_4 = ref.*;
                                ref.* += 1;
                                break :blk_3 tmp_4;
                            };
                            if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                        }).* = tmp;
                        break :blk_1 tmp;
                    };
                };
                _ = blk: {
                    _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
                    break :blk blk_1: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate(~blocklen & @as(c_int, 255)))));
                        (blk_2: {
                            const tmp_3 = blk_3: {
                                const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                                const tmp_4 = ref.*;
                                ref.* += 1;
                                break :blk_3 tmp_4;
                            };
                            if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                        }).* = tmp;
                        break :blk_1 tmp;
                    };
                };
                _ = blk: {
                    _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
                    break :blk blk_1: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate((~blocklen >> @intCast(8)) & @as(c_int, 255)))));
                        (blk_2: {
                            const tmp_3 = blk_3: {
                                const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                                const tmp_4 = ref.*;
                                ref.* += 1;
                                break :blk_3 tmp_4;
                            };
                            if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                        }).* = tmp;
                        break :blk_1 tmp;
                    };
                };
                _ = memcpy(@as(?*anyopaque, @ptrCast(out + @as(usize, @bitCast(@as(isize, @intCast((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))])))))), @as(?*const anyopaque, @ptrCast(data + @as(usize, @bitCast(@as(isize, @intCast(j)))))), @as(c_ulong, @bitCast(@as(c_long, blocklen))));
                (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] += blocklen;
                j += blocklen;
            }
        }
    }
    {
        var s1: c_uint = 1;
        var s2: c_uint = 0;
        var blocklen: c_int = @import("std").zig.c_translation.signedRemainder(data_len, @as(c_int, 5552));
        j = 0;
        while (j < data_len) {
            {
                i = 0;
                while (i < blocklen) : (i += 1) {
                    s1 +%= @as(c_uint, @bitCast(@as(c_uint, (blk: {
                        const tmp = j + i;
                        if (tmp >= 0) break :blk data + @as(usize, @intCast(tmp)) else break :blk data - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                    }).*)));
                    s2 +%= s1;
                }
            }
            s1 %= @as(c_uint, @bitCast(@as(c_int, 65521)));
            s2 %= @as(c_uint, @bitCast(@as(c_int, 65521)));
            j += blocklen;
            blocklen = 5552;
        }
        _ = blk: {
            _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
            break :blk blk_1: {
                const tmp = @as(u8, @bitCast(@as(u8, @truncate((s2 >> @intCast(8)) & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                (blk_2: {
                    const tmp_3 = blk_3: {
                        const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                        const tmp_4 = ref.*;
                        ref.* += 1;
                        break :blk_3 tmp_4;
                    };
                    if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                }).* = tmp;
                break :blk_1 tmp;
            };
        };
        _ = blk: {
            _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
            break :blk blk_1: {
                const tmp = @as(u8, @bitCast(@as(u8, @truncate(s2 & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                (blk_2: {
                    const tmp_3 = blk_3: {
                        const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                        const tmp_4 = ref.*;
                        ref.* += 1;
                        break :blk_3 tmp_4;
                    };
                    if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                }).* = tmp;
                break :blk_1 tmp;
            };
        };
        _ = blk: {
            _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
            break :blk blk_1: {
                const tmp = @as(u8, @bitCast(@as(u8, @truncate((s1 >> @intCast(8)) & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                (blk_2: {
                    const tmp_3 = blk_3: {
                        const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                        const tmp_4 = ref.*;
                        ref.* += 1;
                        break :blk_3 tmp_4;
                    };
                    if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                }).* = tmp;
                break :blk_1 tmp;
            };
        };
        _ = blk: {
            _ = if ((out == null) or (((@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))] + @as(c_int, 1)) >= (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 0)))])) stbiw__sbgrowf(@as([*c]?*anyopaque, @ptrCast(@alignCast(&out))), @as(c_int, 1), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf(u8)))))) else null;
            break :blk blk_1: {
                const tmp = @as(u8, @bitCast(@as(u8, @truncate(s1 & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                (blk_2: {
                    const tmp_3 = blk_3: {
                        const ref = &(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
                        const tmp_4 = ref.*;
                        ref.* += 1;
                        break :blk_3 tmp_4;
                    };
                    if (tmp_3 >= 0) break :blk_2 out + @as(usize, @intCast(tmp_3)) else break :blk_2 out - ~@as(usize, @bitCast(@as(isize, @intCast(tmp_3)) +% -1));
                }).* = tmp;
                break :blk_1 tmp;
            };
        };
    }
    out_len.* = (@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))[@as(c_uint, @intCast(@as(c_int, 1)))];
    _ = memmove(@as(?*anyopaque, @ptrCast(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))), @as(?*const anyopaque, @ptrCast(out)), @as(c_ulong, @bitCast(@as(c_long, out_len.*))));
    return @as([*c]u8, @ptrCast(@alignCast(@as([*c]c_int, @ptrCast(@alignCast(@as(?*anyopaque, @ptrCast(out))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))))));
}
pub fn stbiw__crc32(arg_buffer: [*c]u8, arg_len: c_int) callconv(.C) c_uint {
    var buffer = arg_buffer;
    var len = arg_len;
    const crc_table = struct {
        var static: [256]c_uint = [256]c_uint{
            0,
            @as(c_uint, @bitCast(@as(c_int, 1996959894))),
            3993919788,
            2567524794,
            @as(c_uint, @bitCast(@as(c_int, 124634137))),
            @as(c_uint, @bitCast(@as(c_int, 1886057615))),
            3915621685,
            2657392035,
            @as(c_uint, @bitCast(@as(c_int, 249268274))),
            @as(c_uint, @bitCast(@as(c_int, 2044508324))),
            3772115230,
            2547177864,
            @as(c_uint, @bitCast(@as(c_int, 162941995))),
            @as(c_uint, @bitCast(@as(c_int, 2125561021))),
            3887607047,
            2428444049,
            @as(c_uint, @bitCast(@as(c_int, 498536548))),
            @as(c_uint, @bitCast(@as(c_int, 1789927666))),
            4089016648,
            2227061214,
            @as(c_uint, @bitCast(@as(c_int, 450548861))),
            @as(c_uint, @bitCast(@as(c_int, 1843258603))),
            4107580753,
            2211677639,
            @as(c_uint, @bitCast(@as(c_int, 325883990))),
            @as(c_uint, @bitCast(@as(c_int, 1684777152))),
            4251122042,
            2321926636,
            @as(c_uint, @bitCast(@as(c_int, 335633487))),
            @as(c_uint, @bitCast(@as(c_int, 1661365465))),
            4195302755,
            2366115317,
            @as(c_uint, @bitCast(@as(c_int, 997073096))),
            @as(c_uint, @bitCast(@as(c_int, 1281953886))),
            3579855332,
            2724688242,
            @as(c_uint, @bitCast(@as(c_int, 1006888145))),
            @as(c_uint, @bitCast(@as(c_int, 1258607687))),
            3524101629,
            2768942443,
            @as(c_uint, @bitCast(@as(c_int, 901097722))),
            @as(c_uint, @bitCast(@as(c_int, 1119000684))),
            3686517206,
            2898065728,
            @as(c_uint, @bitCast(@as(c_int, 853044451))),
            @as(c_uint, @bitCast(@as(c_int, 1172266101))),
            3705015759,
            2882616665,
            @as(c_uint, @bitCast(@as(c_int, 651767980))),
            @as(c_uint, @bitCast(@as(c_int, 1373503546))),
            3369554304,
            3218104598,
            @as(c_uint, @bitCast(@as(c_int, 565507253))),
            @as(c_uint, @bitCast(@as(c_int, 1454621731))),
            3485111705,
            3099436303,
            @as(c_uint, @bitCast(@as(c_int, 671266974))),
            @as(c_uint, @bitCast(@as(c_int, 1594198024))),
            3322730930,
            2970347812,
            @as(c_uint, @bitCast(@as(c_int, 795835527))),
            @as(c_uint, @bitCast(@as(c_int, 1483230225))),
            3244367275,
            3060149565,
            @as(c_uint, @bitCast(@as(c_int, 1994146192))),
            @as(c_uint, @bitCast(@as(c_int, 31158534))),
            2563907772,
            4023717930,
            @as(c_uint, @bitCast(@as(c_int, 1907459465))),
            @as(c_uint, @bitCast(@as(c_int, 112637215))),
            2680153253,
            3904427059,
            @as(c_uint, @bitCast(@as(c_int, 2013776290))),
            @as(c_uint, @bitCast(@as(c_int, 251722036))),
            2517215374,
            3775830040,
            @as(c_uint, @bitCast(@as(c_int, 2137656763))),
            @as(c_uint, @bitCast(@as(c_int, 141376813))),
            2439277719,
            3865271297,
            @as(c_uint, @bitCast(@as(c_int, 1802195444))),
            @as(c_uint, @bitCast(@as(c_int, 476864866))),
            2238001368,
            4066508878,
            @as(c_uint, @bitCast(@as(c_int, 1812370925))),
            @as(c_uint, @bitCast(@as(c_int, 453092731))),
            2181625025,
            4111451223,
            @as(c_uint, @bitCast(@as(c_int, 1706088902))),
            @as(c_uint, @bitCast(@as(c_int, 314042704))),
            2344532202,
            4240017532,
            @as(c_uint, @bitCast(@as(c_int, 1658658271))),
            @as(c_uint, @bitCast(@as(c_int, 366619977))),
            2362670323,
            4224994405,
            @as(c_uint, @bitCast(@as(c_int, 1303535960))),
            @as(c_uint, @bitCast(@as(c_int, 984961486))),
            2747007092,
            3569037538,
            @as(c_uint, @bitCast(@as(c_int, 1256170817))),
            @as(c_uint, @bitCast(@as(c_int, 1037604311))),
            2765210733,
            3554079995,
            @as(c_uint, @bitCast(@as(c_int, 1131014506))),
            @as(c_uint, @bitCast(@as(c_int, 879679996))),
            2909243462,
            3663771856,
            @as(c_uint, @bitCast(@as(c_int, 1141124467))),
            @as(c_uint, @bitCast(@as(c_int, 855842277))),
            2852801631,
            3708648649,
            @as(c_uint, @bitCast(@as(c_int, 1342533948))),
            @as(c_uint, @bitCast(@as(c_int, 654459306))),
            3188396048,
            3373015174,
            @as(c_uint, @bitCast(@as(c_int, 1466479909))),
            @as(c_uint, @bitCast(@as(c_int, 544179635))),
            3110523913,
            3462522015,
            @as(c_uint, @bitCast(@as(c_int, 1591671054))),
            @as(c_uint, @bitCast(@as(c_int, 702138776))),
            2966460450,
            3352799412,
            @as(c_uint, @bitCast(@as(c_int, 1504918807))),
            @as(c_uint, @bitCast(@as(c_int, 783551873))),
            3082640443,
            3233442989,
            3988292384,
            2596254646,
            @as(c_uint, @bitCast(@as(c_int, 62317068))),
            @as(c_uint, @bitCast(@as(c_int, 1957810842))),
            3939845945,
            2647816111,
            @as(c_uint, @bitCast(@as(c_int, 81470997))),
            @as(c_uint, @bitCast(@as(c_int, 1943803523))),
            3814918930,
            2489596804,
            @as(c_uint, @bitCast(@as(c_int, 225274430))),
            @as(c_uint, @bitCast(@as(c_int, 2053790376))),
            3826175755,
            2466906013,
            @as(c_uint, @bitCast(@as(c_int, 167816743))),
            @as(c_uint, @bitCast(@as(c_int, 2097651377))),
            4027552580,
            2265490386,
            @as(c_uint, @bitCast(@as(c_int, 503444072))),
            @as(c_uint, @bitCast(@as(c_int, 1762050814))),
            4150417245,
            2154129355,
            @as(c_uint, @bitCast(@as(c_int, 426522225))),
            @as(c_uint, @bitCast(@as(c_int, 1852507879))),
            4275313526,
            2312317920,
            @as(c_uint, @bitCast(@as(c_int, 282753626))),
            @as(c_uint, @bitCast(@as(c_int, 1742555852))),
            4189708143,
            2394877945,
            @as(c_uint, @bitCast(@as(c_int, 397917763))),
            @as(c_uint, @bitCast(@as(c_int, 1622183637))),
            3604390888,
            2714866558,
            @as(c_uint, @bitCast(@as(c_int, 953729732))),
            @as(c_uint, @bitCast(@as(c_int, 1340076626))),
            3518719985,
            2797360999,
            @as(c_uint, @bitCast(@as(c_int, 1068828381))),
            @as(c_uint, @bitCast(@as(c_int, 1219638859))),
            3624741850,
            2936675148,
            @as(c_uint, @bitCast(@as(c_int, 906185462))),
            @as(c_uint, @bitCast(@as(c_int, 1090812512))),
            3747672003,
            2825379669,
            @as(c_uint, @bitCast(@as(c_int, 829329135))),
            @as(c_uint, @bitCast(@as(c_int, 1181335161))),
            3412177804,
            3160834842,
            @as(c_uint, @bitCast(@as(c_int, 628085408))),
            @as(c_uint, @bitCast(@as(c_int, 1382605366))),
            3423369109,
            3138078467,
            @as(c_uint, @bitCast(@as(c_int, 570562233))),
            @as(c_uint, @bitCast(@as(c_int, 1426400815))),
            3317316542,
            2998733608,
            @as(c_uint, @bitCast(@as(c_int, 733239954))),
            @as(c_uint, @bitCast(@as(c_int, 1555261956))),
            3268935591,
            3050360625,
            @as(c_uint, @bitCast(@as(c_int, 752459403))),
            @as(c_uint, @bitCast(@as(c_int, 1541320221))),
            2607071920,
            3965973030,
            @as(c_uint, @bitCast(@as(c_int, 1969922972))),
            @as(c_uint, @bitCast(@as(c_int, 40735498))),
            2617837225,
            3943577151,
            @as(c_uint, @bitCast(@as(c_int, 1913087877))),
            @as(c_uint, @bitCast(@as(c_int, 83908371))),
            2512341634,
            3803740692,
            @as(c_uint, @bitCast(@as(c_int, 2075208622))),
            @as(c_uint, @bitCast(@as(c_int, 213261112))),
            2463272603,
            3855990285,
            @as(c_uint, @bitCast(@as(c_int, 2094854071))),
            @as(c_uint, @bitCast(@as(c_int, 198958881))),
            2262029012,
            4057260610,
            @as(c_uint, @bitCast(@as(c_int, 1759359992))),
            @as(c_uint, @bitCast(@as(c_int, 534414190))),
            2176718541,
            4139329115,
            @as(c_uint, @bitCast(@as(c_int, 1873836001))),
            @as(c_uint, @bitCast(@as(c_int, 414664567))),
            2282248934,
            4279200368,
            @as(c_uint, @bitCast(@as(c_int, 1711684554))),
            @as(c_uint, @bitCast(@as(c_int, 285281116))),
            2405801727,
            4167216745,
            @as(c_uint, @bitCast(@as(c_int, 1634467795))),
            @as(c_uint, @bitCast(@as(c_int, 376229701))),
            2685067896,
            3608007406,
            @as(c_uint, @bitCast(@as(c_int, 1308918612))),
            @as(c_uint, @bitCast(@as(c_int, 956543938))),
            2808555105,
            3495958263,
            @as(c_uint, @bitCast(@as(c_int, 1231636301))),
            @as(c_uint, @bitCast(@as(c_int, 1047427035))),
            2932959818,
            3654703836,
            @as(c_uint, @bitCast(@as(c_int, 1088359270))),
            @as(c_uint, @bitCast(@as(c_int, 936918000))),
            2847714899,
            3736837829,
            @as(c_uint, @bitCast(@as(c_int, 1202900863))),
            @as(c_uint, @bitCast(@as(c_int, 817233897))),
            3183342108,
            3401237130,
            @as(c_uint, @bitCast(@as(c_int, 1404277552))),
            @as(c_uint, @bitCast(@as(c_int, 615818150))),
            3134207493,
            3453421203,
            @as(c_uint, @bitCast(@as(c_int, 1423857449))),
            @as(c_uint, @bitCast(@as(c_int, 601450431))),
            3009837614,
            3294710456,
            @as(c_uint, @bitCast(@as(c_int, 1567103746))),
            @as(c_uint, @bitCast(@as(c_int, 711928724))),
            3020668471,
            3272380065,
            @as(c_uint, @bitCast(@as(c_int, 1510334235))),
            @as(c_uint, @bitCast(@as(c_int, 755167117))),
        };
    };
    var crc: c_uint = ~@as(c_uint, 0);
    var i: c_int = undefined;
    {
        i = 0;
        while (i < len) : (i += 1) {
            crc = (crc >> @intCast(8)) ^ crc_table.static[@as(c_uint, @bitCast(@as(c_uint, (blk: {
                    const tmp = i;
                    if (tmp >= 0) break :blk buffer + @as(usize, @intCast(tmp)) else break :blk buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                }).*))) ^ (crc & @as(c_uint, @bitCast(@as(c_int, 255))))];
        }
    }
    return ~crc;
}
pub fn stbiw__wpcrc(arg_data: [*c][*c]u8, arg_len: c_int) callconv(.C) void {
    var data = arg_data;
    var len = arg_len;
    var crc: c_uint = stbiw__crc32((data.* - @as(usize, @bitCast(@as(isize, @intCast(len))))) - @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4))))), len + @as(c_int, 4));
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    data.*[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(u8, @truncate((crc >> @intCast(24)) & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(u8, @truncate((crc >> @intCast(16)) & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                        data.*[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(u8, @truncate((crc >> @intCast(8)) & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                    data.*[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(u8, @truncate(crc & @as(c_uint, @bitCast(@as(c_int, 255)))))));
                data.*[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &data.*;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
}
pub fn stbiw__paeth(arg_a: c_int, arg_b: c_int, arg_c: c_int) callconv(.C) u8 {
    var a = arg_a;
    var b = arg_b;
    var c = arg_c;
    var p: c_int = (a + b) - c;
    var pa: c_int = abs(p - a);
    var pb: c_int = abs(p - b);
    var pc: c_int = abs(p - c);
    if ((pa <= pb) and (pa <= pc)) return @as(u8, @bitCast(@as(i8, @truncate(a & @as(c_int, 255)))));
    if (pb <= pc) return @as(u8, @bitCast(@as(i8, @truncate(b & @as(c_int, 255)))));
    return @as(u8, @bitCast(@as(i8, @truncate(c & @as(c_int, 255)))));
}
pub fn stbiw__encode_png_line(arg_pixels: [*c]u8, arg_stride_bytes: c_int, arg_width: c_int, arg_height: c_int, arg_y: c_int, arg_n: c_int, arg_filter_type: c_int, arg_line_buffer: [*c]i8) callconv(.C) void {
    var pixels = arg_pixels;
    var stride_bytes = arg_stride_bytes;
    var width = arg_width;
    var height = arg_height;
    var y = arg_y;
    var n = arg_n;
    var filter_type = arg_filter_type;
    var line_buffer = arg_line_buffer;
    const mapping = struct {
        var static: [5]c_int = [5]c_int{
            0,
            1,
            2,
            3,
            4,
        };
    };
    const firstmap = struct {
        var static: [5]c_int = [5]c_int{
            0,
            1,
            0,
            5,
            6,
        };
    };
    var mymap: [*c]c_int = if (y != @as(c_int, 0)) @as([*c]c_int, @ptrCast(@alignCast(&mapping.static))) else @as([*c]c_int, @ptrCast(@alignCast(&firstmap.static)));
    var i: c_int = undefined;
    var @"type": c_int = (blk: {
        const tmp = filter_type;
        if (tmp >= 0) break :blk mymap + @as(usize, @intCast(tmp)) else break :blk mymap - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
    }).*;
    var z: [*c]u8 = pixels + @as(usize, @bitCast(@as(isize, @intCast(stride_bytes * (if (stbi__flip_vertically_on_write != 0) (height - @as(c_int, 1)) - y else y)))));
    var signed_stride: c_int = if (stbi__flip_vertically_on_write != 0) -stride_bytes else stride_bytes;
    if (@"type" == @as(c_int, 0)) {
        _ = memcpy(@as(?*anyopaque, @ptrCast(line_buffer)), @as(?*const anyopaque, @ptrCast(z)), @as(c_ulong, @bitCast(@as(c_long, width * n))));
        return;
    }
    {
        i = 0;
        while (i < n) : (i += 1) {
            while (true) {
                switch (@"type") {
                    @as(c_int, 1) => {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast((blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*));
                        break;
                    },
                    @as(c_int, 2) => {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - signed_stride;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*)))))));
                        break;
                    },
                    @as(c_int, 3) => {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - (@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - signed_stride;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) >> @intCast(1))))));
                        break;
                    },
                    @as(c_int, 4) => {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - @as(c_int, @bitCast(@as(c_uint, stbiw__paeth(@as(c_int, 0), @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - signed_stride;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))), @as(c_int, 0)))))))));
                        break;
                    },
                    @as(c_int, 5) => {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast((blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*));
                        break;
                    },
                    @as(c_int, 6) => {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast((blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*));
                        break;
                    },
                    else => {},
                }
                break;
            }
        }
    }
    while (true) {
        switch (@"type") {
            @as(c_int, 1) => {
                {
                    i = n;
                    while (i < (width * n)) : (i += 1) {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - n;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*)))))));
                    }
                }
                break;
            },
            @as(c_int, 2) => {
                {
                    i = n;
                    while (i < (width * n)) : (i += 1) {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - signed_stride;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*)))))));
                    }
                }
                break;
            },
            @as(c_int, 3) => {
                {
                    i = n;
                    while (i < (width * n)) : (i += 1) {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - ((@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - n;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) + @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - signed_stride;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*)))) >> @intCast(1))))));
                    }
                }
                break;
            },
            @as(c_int, 4) => {
                {
                    i = n;
                    while (i < (width * n)) : (i += 1) {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - @as(c_int, @bitCast(@as(c_uint, stbiw__paeth(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - n;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))), @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - signed_stride;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))), @as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = (i - signed_stride) - n;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*)))))))))));
                    }
                }
                break;
            },
            @as(c_int, 5) => {
                {
                    i = n;
                    while (i < (width * n)) : (i += 1) {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - (@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - n;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) >> @intCast(1))))));
                    }
                }
                break;
            },
            @as(c_int, 6) => {
                {
                    i = n;
                    while (i < (width * n)) : (i += 1) {
                        (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).* = @as(i8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))) - @as(c_int, @bitCast(@as(c_uint, stbiw__paeth(@as(c_int, @bitCast(@as(c_uint, (blk: {
                            const tmp = i - n;
                            if (tmp >= 0) break :blk z + @as(usize, @intCast(tmp)) else break :blk z - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                        }).*))), @as(c_int, 0), @as(c_int, 0)))))))));
                    }
                }
                break;
            },
            else => {},
        }
        break;
    }
}
pub fn stbi_write_png_to_mem(arg_pixels: [*c]const u8, arg_stride_bytes: c_int, arg_x: c_int, arg_y: c_int, arg_n: c_int, arg_out_len: [*c]c_int) callconv(.C) [*c]u8 {
    var pixels = arg_pixels;
    var stride_bytes = arg_stride_bytes;
    var x = arg_x;
    var y = arg_y;
    var n = arg_n;
    var out_len = arg_out_len;
    var force_filter: c_int = stbi_write_force_png_filter;
    var ctype: [5]c_int = [5]c_int{
        -@as(c_int, 1),
        0,
        4,
        2,
        6,
    };
    var sig: [8]u8 = [8]u8{
        137,
        80,
        78,
        71,
        13,
        10,
        26,
        10,
    };
    var out: [*c]u8 = undefined;
    var o: [*c]u8 = undefined;
    var filt: [*c]u8 = undefined;
    var zlib: [*c]u8 = undefined;
    var line_buffer: [*c]i8 = undefined;
    var j: c_int = undefined;
    var zlen: c_int = undefined;
    if (stride_bytes == @as(c_int, 0)) {
        stride_bytes = x * n;
    }
    if (force_filter >= @as(c_int, 5)) {
        force_filter = -@as(c_int, 1);
    }
    filt = @as([*c]u8, @ptrCast(@alignCast(malloc(@as(c_ulong, @bitCast(@as(c_long, ((x * n) + @as(c_int, 1)) * y)))))));
    if (!(filt != null)) return null;
    line_buffer = @as([*c]i8, @ptrCast(@alignCast(malloc(@as(c_ulong, @bitCast(@as(c_long, x * n)))))));
    if (!(line_buffer != null)) {
        free(@as(?*anyopaque, @ptrCast(filt)));
        return null;
    }
    {
        j = 0;
        while (j < y) : (j += 1) {
            var filter_type: c_int = undefined;
            if (force_filter > -@as(c_int, 1)) {
                filter_type = force_filter;
                stbiw__encode_png_line(@as([*c]u8, @ptrCast(@volatileCast(@constCast(pixels)))), stride_bytes, x, y, j, n, force_filter, line_buffer);
            } else {
                var best_filter: c_int = 0;
                var best_filter_val: c_int = 2147483647;
                var est: c_int = undefined;
                var i: c_int = undefined;
                {
                    filter_type = 0;
                    while (filter_type < @as(c_int, 5)) : (filter_type += 1) {
                        stbiw__encode_png_line(@as([*c]u8, @ptrCast(@volatileCast(@constCast(pixels)))), stride_bytes, x, y, j, n, filter_type, line_buffer);
                        est = 0;
                        {
                            i = 0;
                            while (i < (x * n)) : (i += 1) {
                                est += abs(@as(c_int, @bitCast(@as(c_int, (blk: {
                                    const tmp = i;
                                    if (tmp >= 0) break :blk line_buffer + @as(usize, @intCast(tmp)) else break :blk line_buffer - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                                }).*))));
                            }
                        }
                        if (est < best_filter_val) {
                            best_filter_val = est;
                            best_filter = filter_type;
                        }
                    }
                }
                if (filter_type != best_filter) {
                    stbiw__encode_png_line(@as([*c]u8, @ptrCast(@volatileCast(@constCast(pixels)))), stride_bytes, x, y, j, n, best_filter, line_buffer);
                    filter_type = best_filter;
                }
            }
            (blk: {
                const tmp = j * ((x * n) + @as(c_int, 1));
                if (tmp >= 0) break :blk filt + @as(usize, @intCast(tmp)) else break :blk filt - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).* = @as(u8, @bitCast(@as(i8, @truncate(filter_type))));
            _ = memmove(@as(?*anyopaque, @ptrCast((filt + @as(usize, @bitCast(@as(isize, @intCast(j * ((x * n) + @as(c_int, 1))))))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))), @as(?*const anyopaque, @ptrCast(line_buffer)), @as(c_ulong, @bitCast(@as(c_long, x * n))));
        }
    }
    free(@as(?*anyopaque, @ptrCast(line_buffer)));
    zlib = stbi_zlib_compress(filt, y * ((x * n) + @as(c_int, 1)), &zlen, stbi_write_png_compression_level);
    free(@as(?*anyopaque, @ptrCast(filt)));
    if (!(zlib != null)) return null;
    out = @as([*c]u8, @ptrCast(@alignCast(malloc(@as(c_ulong, @bitCast(@as(c_long, ((((@as(c_int, 8) + @as(c_int, 12)) + @as(c_int, 13)) + @as(c_int, 12)) + zlen) + @as(c_int, 12))))))));
    if (!(out != null)) return null;
    out_len.* = ((((@as(c_int, 8) + @as(c_int, 12)) + @as(c_int, 13)) + @as(c_int, 12)) + zlen) + @as(c_int, 12);
    o = out;
    _ = memmove(@as(?*anyopaque, @ptrCast(o)), @as(?*const anyopaque, @ptrCast(@as([*c]u8, @ptrCast(@alignCast(&sig))))), @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8)))));
    o += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8)))));
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate((@as(c_int, 13) >> @intCast(24)) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate((@as(c_int, 13) >> @intCast(16)) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate((@as(c_int, 13) >> @intCast(8)) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 13) & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IHDR"[@as(c_uint, @intCast(@as(c_int, 0)))]))) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IHDR"[@as(c_uint, @intCast(@as(c_int, 1)))]))) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IHDR"[@as(c_uint, @intCast(@as(c_int, 2)))]))) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IHDR"[@as(c_uint, @intCast(@as(c_int, 3)))]))) & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate((x >> @intCast(24)) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate((x >> @intCast(16)) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate((x >> @intCast(8)) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(x & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate((y >> @intCast(24)) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate((y >> @intCast(16)) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate((y >> @intCast(8)) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(y & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    (blk: {
        const ref = &o;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = 8;
    (blk: {
        const ref = &o;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = @as(u8, @bitCast(@as(i8, @truncate(ctype[@as(c_uint, @intCast(n))] & @as(c_int, 255)))));
    (blk: {
        const ref = &o;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = 0;
    (blk: {
        const ref = &o;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = 0;
    (blk: {
        const ref = &o;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }).* = 0;
    stbiw__wpcrc(&o, @as(c_int, 13));
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate((zlen >> @intCast(24)) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate((zlen >> @intCast(16)) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate((zlen >> @intCast(8)) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(zlen & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IDAT"[@as(c_uint, @intCast(@as(c_int, 0)))]))) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IDAT"[@as(c_uint, @intCast(@as(c_int, 1)))]))) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IDAT"[@as(c_uint, @intCast(@as(c_int, 2)))]))) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IDAT"[@as(c_uint, @intCast(@as(c_int, 3)))]))) & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    _ = memmove(@as(?*anyopaque, @ptrCast(o)), @as(?*const anyopaque, @ptrCast(zlib)), @as(c_ulong, @bitCast(@as(c_long, zlen))));
    o += @as(usize, @bitCast(@as(isize, @intCast(zlen))));
    free(@as(?*anyopaque, @ptrCast(zlib)));
    stbiw__wpcrc(&o, zlen);
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate((@as(c_int, 0) >> @intCast(24)) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate((@as(c_int, 0) >> @intCast(16)) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate((@as(c_int, 0) >> @intCast(8)) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 0) & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    _ = blk: {
        _ = blk_1: {
            _ = blk_2: {
                _ = blk_3: {
                    o[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IEND"[@as(c_uint, @intCast(@as(c_int, 0)))]))) & @as(c_int, 255)))));
                    break :blk_3 blk_4: {
                        const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IEND"[@as(c_uint, @intCast(@as(c_int, 1)))]))) & @as(c_int, 255)))));
                        o[@as(c_uint, @intCast(@as(c_int, 1)))] = tmp;
                        break :blk_4 tmp;
                    };
                };
                break :blk_2 blk_3: {
                    const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IEND"[@as(c_uint, @intCast(@as(c_int, 2)))]))) & @as(c_int, 255)))));
                    o[@as(c_uint, @intCast(@as(c_int, 2)))] = tmp;
                    break :blk_3 tmp;
                };
            };
            break :blk_1 blk_2: {
                const tmp = @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, @bitCast(@as(c_uint, "IEND"[@as(c_uint, @intCast(@as(c_int, 3)))]))) & @as(c_int, 255)))));
                o[@as(c_uint, @intCast(@as(c_int, 3)))] = tmp;
                break :blk_2 tmp;
            };
        };
        break :blk blk_1: {
            const ref = &o;
            ref.* += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            break :blk_1 ref.*;
        };
    };
    stbiw__wpcrc(&o, @as(c_int, 0));
    _ = @as(c_int, 0);
    return out;
}
pub const stbiw__jpg_ZigZag: [64]u8 = [64]u8{
    0,
    1,
    5,
    6,
    14,
    15,
    27,
    28,
    2,
    4,
    7,
    13,
    16,
    26,
    29,
    42,
    3,
    8,
    12,
    17,
    25,
    30,
    41,
    43,
    9,
    11,
    18,
    24,
    31,
    40,
    44,
    53,
    10,
    19,
    23,
    32,
    39,
    45,
    52,
    54,
    20,
    22,
    33,
    38,
    46,
    51,
    55,
    60,
    21,
    34,
    37,
    47,
    50,
    56,
    59,
    61,
    35,
    36,
    48,
    49,
    57,
    58,
    62,
    63,
};
pub fn stbiw__jpg_writeBits(arg_s: [*c]stbi__write_context, arg_bitBufP: [*c]c_int, arg_bitCntP: [*c]c_int, arg_bs: [*c]const c_ushort) callconv(.C) void {
    var s = arg_s;
    var bitBufP = arg_bitBufP;
    var bitCntP = arg_bitCntP;
    var bs = arg_bs;
    var bitBuf: c_int = bitBufP.*;
    var bitCnt: c_int = bitCntP.*;
    bitCnt += @as(c_int, @bitCast(@as(c_uint, bs[@as(c_uint, @intCast(@as(c_int, 1)))])));
    bitBuf |= @as(c_int, @bitCast(@as(c_uint, bs[@as(c_uint, @intCast(@as(c_int, 0)))]))) << @intCast(@as(c_int, 24) - bitCnt);
    while (bitCnt >= @as(c_int, 8)) {
        var c: u8 = @as(u8, @bitCast(@as(i8, @truncate((bitBuf >> @intCast(16)) & @as(c_int, 255)))));
        stbiw__putc(s, c);
        if (@as(c_int, @bitCast(@as(c_uint, c))) == @as(c_int, 255)) {
            stbiw__putc(s, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 0))))));
        }
        bitBuf <<= @intCast(@as(c_int, 8));
        bitCnt -= @as(c_int, 8);
    }
    bitBufP.* = bitBuf;
    bitCntP.* = bitCnt;
}
pub fn stbiw__jpg_DCT(arg_d0p: [*c]f32, arg_d1p: [*c]f32, arg_d2p: [*c]f32, arg_d3p: [*c]f32, arg_d4p: [*c]f32, arg_d5p: [*c]f32, arg_d6p: [*c]f32, arg_d7p: [*c]f32) callconv(.C) void {
    var d0p = arg_d0p;
    var d1p = arg_d1p;
    var d2p = arg_d2p;
    var d3p = arg_d3p;
    var d4p = arg_d4p;
    var d5p = arg_d5p;
    var d6p = arg_d6p;
    var d7p = arg_d7p;
    var d0: f32 = d0p.*;
    var d1: f32 = d1p.*;
    var d2: f32 = d2p.*;
    var d3: f32 = d3p.*;
    var d4: f32 = d4p.*;
    var d5: f32 = d5p.*;
    var d6: f32 = d6p.*;
    var d7: f32 = d7p.*;
    var z1: f32 = undefined;
    var z2: f32 = undefined;
    var z3: f32 = undefined;
    var z4: f32 = undefined;
    var z5: f32 = undefined;
    var z11: f32 = undefined;
    var z13: f32 = undefined;
    var tmp0: f32 = d0 + d7;
    var tmp7: f32 = d0 - d7;
    var tmp1: f32 = d1 + d6;
    var tmp6: f32 = d1 - d6;
    var tmp2: f32 = d2 + d5;
    var tmp5: f32 = d2 - d5;
    var tmp3: f32 = d3 + d4;
    var tmp4: f32 = d3 - d4;
    var tmp10: f32 = tmp0 + tmp3;
    var tmp13: f32 = tmp0 - tmp3;
    var tmp11: f32 = tmp1 + tmp2;
    var tmp12: f32 = tmp1 - tmp2;
    d0 = tmp10 + tmp11;
    d4 = tmp10 - tmp11;
    z1 = (tmp12 + tmp13) * 0.7071067690849304;
    d2 = tmp13 + z1;
    d6 = tmp13 - z1;
    tmp10 = tmp4 + tmp5;
    tmp11 = tmp5 + tmp6;
    tmp12 = tmp6 + tmp7;
    z5 = (tmp10 - tmp12) * 0.3826834261417389;
    z2 = (tmp10 * 0.5411961078643799) + z5;
    z4 = (tmp12 * 1.3065630197525024) + z5;
    z3 = tmp11 * 0.7071067690849304;
    z11 = tmp7 + z3;
    z13 = tmp7 - z3;
    d5p.* = z13 + z2;
    d3p.* = z13 - z2;
    d1p.* = z11 + z4;
    d7p.* = z11 - z4;
    d0p.* = d0;
    d2p.* = d2;
    d4p.* = d4;
    d6p.* = d6;
}
pub fn stbiw__jpg_calcBits(arg_val: c_int, arg_bits: [*c]c_ushort) callconv(.C) void {
    var val = arg_val;
    var bits = arg_bits;
    var tmp1: c_int = if (val < @as(c_int, 0)) -val else val;
    val = if (val < @as(c_int, 0)) val - @as(c_int, 1) else val;
    bits[@as(c_uint, @intCast(@as(c_int, 1)))] = 1;
    while ((blk: {
        const ref = &tmp1;
        ref.* >>= @intCast(@as(c_int, 1));
        break :blk ref.*;
    }) != 0) {
        bits[@as(c_uint, @intCast(@as(c_int, 1)))] +%= 1;
    }
    bits[@as(c_uint, @intCast(@as(c_int, 0)))] = @as(c_ushort, @bitCast(@as(c_short, @truncate(val & ((@as(c_int, 1) << @intCast(@as(c_int, @bitCast(@as(c_uint, bits[@as(c_uint, @intCast(@as(c_int, 1)))]))))) - @as(c_int, 1))))));
}
pub fn stbiw__jpg_processDU(arg_s: [*c]stbi__write_context, arg_bitBuf: [*c]c_int, arg_bitCnt: [*c]c_int, arg_CDU: [*c]f32, arg_du_stride: c_int, arg_fdtbl: [*c]f32, arg_DC: c_int, HTDC: [*c]const [2]c_ushort, HTAC: [*c]const [2]c_ushort) callconv(.C) c_int {
    var s = arg_s;
    var bitBuf = arg_bitBuf;
    var bitCnt = arg_bitCnt;
    var CDU = arg_CDU;
    var du_stride = arg_du_stride;
    var fdtbl = arg_fdtbl;
    var DC = arg_DC;
    const EOB: [2]c_ushort = [2]c_ushort{
        HTAC[@as(c_uint, @intCast(@as(c_int, 0)))][@as(c_uint, @intCast(@as(c_int, 0)))],
        HTAC[@as(c_uint, @intCast(@as(c_int, 0)))][@as(c_uint, @intCast(@as(c_int, 1)))],
    };
    const M16zeroes: [2]c_ushort = [2]c_ushort{
        HTAC[@as(c_uint, @intCast(@as(c_int, 240)))][@as(c_uint, @intCast(@as(c_int, 0)))],
        HTAC[@as(c_uint, @intCast(@as(c_int, 240)))][@as(c_uint, @intCast(@as(c_int, 1)))],
    };
    var dataOff: c_int = undefined;
    var i: c_int = undefined;
    var j: c_int = undefined;
    var n: c_int = undefined;
    var diff: c_int = undefined;
    var end0pos: c_int = undefined;
    var x: c_int = undefined;
    var y: c_int = undefined;
    var DU: [64]c_int = undefined;
    {
        _ = blk: {
            dataOff = 0;
            break :blk blk_1: {
                const tmp = du_stride * @as(c_int, 8);
                n = tmp;
                break :blk_1 tmp;
            };
        };
        while (dataOff < n) : (dataOff += du_stride) {
            stbiw__jpg_DCT(&(blk: {
                const tmp = dataOff;
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + @as(c_int, 1);
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + @as(c_int, 2);
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + @as(c_int, 3);
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + @as(c_int, 4);
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + @as(c_int, 5);
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + @as(c_int, 6);
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + @as(c_int, 7);
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*);
        }
    }
    {
        dataOff = 0;
        while (dataOff < @as(c_int, 8)) : (dataOff += 1) {
            stbiw__jpg_DCT(&(blk: {
                const tmp = dataOff;
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + du_stride;
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + (du_stride * @as(c_int, 2));
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + (du_stride * @as(c_int, 3));
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + (du_stride * @as(c_int, 4));
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + (du_stride * @as(c_int, 5));
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + (du_stride * @as(c_int, 6));
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*, &(blk: {
                const tmp = dataOff + (du_stride * @as(c_int, 7));
                if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*);
        }
    }
    {
        _ = blk: {
            y = 0;
            break :blk blk_1: {
                const tmp = @as(c_int, 0);
                j = tmp;
                break :blk_1 tmp;
            };
        };
        while (y < @as(c_int, 8)) : (y += 1) {
            {
                x = 0;
                while (x < @as(c_int, 8)) : (_ = blk: {
                    x += 1;
                    break :blk blk_1: {
                        const ref = &j;
                        ref.* += 1;
                        break :blk_1 ref.*;
                    };
                }) {
                    var v: f32 = undefined;
                    i = (y * du_stride) + x;
                    v = (blk: {
                        const tmp = i;
                        if (tmp >= 0) break :blk CDU + @as(usize, @intCast(tmp)) else break :blk CDU - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                    }).* * (blk: {
                        const tmp = j;
                        if (tmp >= 0) break :blk fdtbl + @as(usize, @intCast(tmp)) else break :blk fdtbl - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                    }).*;
                    DU[stbiw__jpg_ZigZag[@as(c_uint, @intCast(j))]] = @as(c_int, @intFromFloat(if (v < @as(f32, @floatFromInt(@as(c_int, 0)))) v - 0.5 else v + 0.5));
                }
            }
        }
    }
    diff = DU[@as(c_uint, @intCast(@as(c_int, 0)))] - DC;
    if (diff == @as(c_int, 0)) {
        stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]const c_ushort, @ptrCast(@alignCast(&HTDC[@as(c_uint, @intCast(@as(c_int, 0)))]))));
    } else {
        var bits: [2]c_ushort = undefined;
        stbiw__jpg_calcBits(diff, @as([*c]c_ushort, @ptrCast(@alignCast(&bits))));
        stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]const c_ushort, @ptrCast(@alignCast(&HTDC[bits[@as(c_uint, @intCast(@as(c_int, 1)))]]))));
        stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]c_ushort, @ptrCast(@alignCast(&bits))));
    }
    end0pos = 63;
    while ((end0pos > @as(c_int, 0)) and (DU[@as(c_uint, @intCast(end0pos))] == @as(c_int, 0))) : (end0pos -= 1) {}
    if (end0pos == @as(c_int, 0)) {
        stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]const c_ushort, @ptrCast(@alignCast(&EOB))));
        return DU[@as(c_uint, @intCast(@as(c_int, 0)))];
    }
    {
        i = 1;
        while (i <= end0pos) : (i += 1) {
            var startpos: c_int = i;
            var nrzeroes: c_int = undefined;
            var bits: [2]c_ushort = undefined;
            while ((DU[@as(c_uint, @intCast(i))] == @as(c_int, 0)) and (i <= end0pos)) : (i += 1) {}
            nrzeroes = i - startpos;
            if (nrzeroes >= @as(c_int, 16)) {
                var lng: c_int = nrzeroes >> @intCast(4);
                var nrmarker: c_int = undefined;
                {
                    nrmarker = 1;
                    while (nrmarker <= lng) : (nrmarker += 1) {
                        stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]const c_ushort, @ptrCast(@alignCast(&M16zeroes))));
                    }
                }
                nrzeroes &= @as(c_int, 15);
            }
            stbiw__jpg_calcBits(DU[@as(c_uint, @intCast(i))], @as([*c]c_ushort, @ptrCast(@alignCast(&bits))));
            stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]const c_ushort, @ptrCast(@alignCast(&(blk: {
                const tmp = (nrzeroes << @intCast(4)) + @as(c_int, @bitCast(@as(c_uint, bits[@as(c_uint, @intCast(@as(c_int, 1)))])));
                if (tmp >= 0) break :blk HTAC + @as(usize, @intCast(tmp)) else break :blk HTAC - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*))));
            stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]c_ushort, @ptrCast(@alignCast(&bits))));
        }
    }
    if (end0pos != @as(c_int, 63)) {
        stbiw__jpg_writeBits(s, bitBuf, bitCnt, @as([*c]const c_ushort, @ptrCast(@alignCast(&EOB))));
    }
    return DU[@as(c_uint, @intCast(@as(c_int, 0)))];
}
pub fn stbi_write_jpg_core(arg_s: [*c]stbi__write_context, arg_width: c_int, arg_height: c_int, arg_comp: c_int, arg_data: ?*const anyopaque, arg_quality: c_int) callconv(.C) c_int {
    var s = arg_s;
    var width = arg_width;
    var height = arg_height;
    var comp = arg_comp;
    var data = arg_data;
    var quality = arg_quality;
    const std_dc_luminance_nrcodes = struct {
        const static: [17]u8 = [17]u8{
            0,
            0,
            1,
            5,
            1,
            1,
            1,
            1,
            1,
            1,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
        };
    };
    const std_dc_luminance_values = struct {
        const static: [12]u8 = [12]u8{
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
        };
    };
    const std_ac_luminance_nrcodes = struct {
        const static: [17]u8 = [17]u8{
            0,
            0,
            2,
            1,
            3,
            3,
            2,
            4,
            3,
            5,
            5,
            4,
            4,
            0,
            0,
            1,
            125,
        };
    };
    const std_ac_luminance_values = struct {
        const static: [162]u8 = [162]u8{
            1,
            2,
            3,
            0,
            4,
            17,
            5,
            18,
            33,
            49,
            65,
            6,
            19,
            81,
            97,
            7,
            34,
            113,
            20,
            50,
            129,
            145,
            161,
            8,
            35,
            66,
            177,
            193,
            21,
            82,
            209,
            240,
            36,
            51,
            98,
            114,
            130,
            9,
            10,
            22,
            23,
            24,
            25,
            26,
            37,
            38,
            39,
            40,
            41,
            42,
            52,
            53,
            54,
            55,
            56,
            57,
            58,
            67,
            68,
            69,
            70,
            71,
            72,
            73,
            74,
            83,
            84,
            85,
            86,
            87,
            88,
            89,
            90,
            99,
            100,
            101,
            102,
            103,
            104,
            105,
            106,
            115,
            116,
            117,
            118,
            119,
            120,
            121,
            122,
            131,
            132,
            133,
            134,
            135,
            136,
            137,
            138,
            146,
            147,
            148,
            149,
            150,
            151,
            152,
            153,
            154,
            162,
            163,
            164,
            165,
            166,
            167,
            168,
            169,
            170,
            178,
            179,
            180,
            181,
            182,
            183,
            184,
            185,
            186,
            194,
            195,
            196,
            197,
            198,
            199,
            200,
            201,
            202,
            210,
            211,
            212,
            213,
            214,
            215,
            216,
            217,
            218,
            225,
            226,
            227,
            228,
            229,
            230,
            231,
            232,
            233,
            234,
            241,
            242,
            243,
            244,
            245,
            246,
            247,
            248,
            249,
            250,
        };
    };
    const std_dc_chrominance_nrcodes = struct {
        const static: [17]u8 = [17]u8{
            0,
            0,
            3,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            1,
            0,
            0,
            0,
            0,
            0,
        };
    };
    const std_dc_chrominance_values = struct {
        const static: [12]u8 = [12]u8{
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
            11,
        };
    };
    const std_ac_chrominance_nrcodes = struct {
        const static: [17]u8 = [17]u8{
            0,
            0,
            2,
            1,
            2,
            4,
            4,
            3,
            4,
            7,
            5,
            4,
            4,
            0,
            1,
            2,
            119,
        };
    };
    const std_ac_chrominance_values = struct {
        const static: [162]u8 = [162]u8{
            0,
            1,
            2,
            3,
            17,
            4,
            5,
            33,
            49,
            6,
            18,
            65,
            81,
            7,
            97,
            113,
            19,
            34,
            50,
            129,
            8,
            20,
            66,
            145,
            161,
            177,
            193,
            9,
            35,
            51,
            82,
            240,
            21,
            98,
            114,
            209,
            10,
            22,
            36,
            52,
            225,
            37,
            241,
            23,
            24,
            25,
            26,
            38,
            39,
            40,
            41,
            42,
            53,
            54,
            55,
            56,
            57,
            58,
            67,
            68,
            69,
            70,
            71,
            72,
            73,
            74,
            83,
            84,
            85,
            86,
            87,
            88,
            89,
            90,
            99,
            100,
            101,
            102,
            103,
            104,
            105,
            106,
            115,
            116,
            117,
            118,
            119,
            120,
            121,
            122,
            130,
            131,
            132,
            133,
            134,
            135,
            136,
            137,
            138,
            146,
            147,
            148,
            149,
            150,
            151,
            152,
            153,
            154,
            162,
            163,
            164,
            165,
            166,
            167,
            168,
            169,
            170,
            178,
            179,
            180,
            181,
            182,
            183,
            184,
            185,
            186,
            194,
            195,
            196,
            197,
            198,
            199,
            200,
            201,
            202,
            210,
            211,
            212,
            213,
            214,
            215,
            216,
            217,
            218,
            226,
            227,
            228,
            229,
            230,
            231,
            232,
            233,
            234,
            242,
            243,
            244,
            245,
            246,
            247,
            248,
            249,
            250,
        };
    };
    const YDC_HT = struct {
        const static: [256][2]c_ushort = [12][2]c_ushort{
            [2]c_ushort{
                0,
                2,
            },
            [2]c_ushort{
                2,
                3,
            },
            [2]c_ushort{
                3,
                3,
            },
            [2]c_ushort{
                4,
                3,
            },
            [2]c_ushort{
                5,
                3,
            },
            [2]c_ushort{
                6,
                3,
            },
            [2]c_ushort{
                14,
                4,
            },
            [2]c_ushort{
                30,
                5,
            },
            [2]c_ushort{
                62,
                6,
            },
            [2]c_ushort{
                126,
                7,
            },
            [2]c_ushort{
                254,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 510))))),
                9,
            },
        } ++ [1][2]c_ushort{@import("std").mem.zeroes([2]c_ushort)} ** 244;
    };
    const UVDC_HT = struct {
        const static: [256][2]c_ushort = [12][2]c_ushort{
            [2]c_ushort{
                0,
                2,
            },
            [2]c_ushort{
                1,
                2,
            },
            [2]c_ushort{
                2,
                2,
            },
            [2]c_ushort{
                6,
                3,
            },
            [2]c_ushort{
                14,
                4,
            },
            [2]c_ushort{
                30,
                5,
            },
            [2]c_ushort{
                62,
                6,
            },
            [2]c_ushort{
                126,
                7,
            },
            [2]c_ushort{
                254,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 510))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1022))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2046))))),
                11,
            },
        } ++ [1][2]c_ushort{@import("std").mem.zeroes([2]c_ushort)} ** 244;
    };
    const YAC_HT = struct {
        const static: [256][2]c_ushort = [256][2]c_ushort{
            [2]c_ushort{
                10,
                4,
            },
            [2]c_ushort{
                0,
                2,
            },
            [2]c_ushort{
                1,
                2,
            },
            [2]c_ushort{
                4,
                3,
            },
            [2]c_ushort{
                11,
                4,
            },
            [2]c_ushort{
                26,
                5,
            },
            [2]c_ushort{
                120,
                7,
            },
            [2]c_ushort{
                248,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1014))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65410))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65411))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                12,
                4,
            },
            [2]c_ushort{
                27,
                5,
            },
            [2]c_ushort{
                121,
                7,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 502))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2038))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65412))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65413))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65414))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65415))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65416))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                28,
                5,
            },
            [2]c_ushort{
                249,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1015))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4084))))),
                12,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65417))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65418))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65419))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65420))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65421))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65422))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                58,
                6,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 503))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4085))))),
                12,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65423))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65424))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65425))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65426))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65427))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65428))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65429))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                59,
                6,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1016))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65430))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65431))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65432))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65433))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65434))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65435))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65436))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65437))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                122,
                7,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2039))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65438))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65439))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65440))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65441))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65442))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65443))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65444))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65445))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                123,
                7,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4086))))),
                12,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65446))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65447))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65448))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65449))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65450))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65451))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65452))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65453))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                250,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4087))))),
                12,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65454))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65455))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65456))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65457))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65458))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65459))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65460))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65461))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 504))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 32704))))),
                15,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65462))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65463))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65464))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65465))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65466))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65467))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65468))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65469))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 505))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65470))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65471))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65472))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65473))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65474))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65475))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65476))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65477))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65478))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 506))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65479))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65480))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65481))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65482))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65483))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65484))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65485))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65486))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65487))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1017))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65488))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65489))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65490))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65491))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65492))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65493))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65494))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65495))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65496))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1018))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65497))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65498))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65499))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65500))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65501))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65502))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65503))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65504))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65505))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2040))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65506))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65507))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65508))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65509))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65510))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65511))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65512))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65513))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65514))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65515))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65516))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65517))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65518))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65519))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65520))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65521))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65522))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65523))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65524))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2041))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65525))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65526))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65527))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65528))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65529))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65530))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65531))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65532))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65533))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65534))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
        };
    };
    const UVAC_HT = struct {
        const static: [256][2]c_ushort = [256][2]c_ushort{
            [2]c_ushort{
                0,
                2,
            },
            [2]c_ushort{
                1,
                2,
            },
            [2]c_ushort{
                4,
                3,
            },
            [2]c_ushort{
                10,
                4,
            },
            [2]c_ushort{
                24,
                5,
            },
            [2]c_ushort{
                25,
                5,
            },
            [2]c_ushort{
                56,
                6,
            },
            [2]c_ushort{
                120,
                7,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 500))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1014))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4084))))),
                12,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                11,
                4,
            },
            [2]c_ushort{
                57,
                6,
            },
            [2]c_ushort{
                246,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 501))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2038))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4085))))),
                12,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65416))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65417))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65418))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65419))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                26,
                5,
            },
            [2]c_ushort{
                247,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1015))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4086))))),
                12,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 32706))))),
                15,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65420))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65421))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65422))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65423))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65424))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                27,
                5,
            },
            [2]c_ushort{
                248,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1016))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 4087))))),
                12,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65425))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65426))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65427))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65428))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65429))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65430))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                58,
                6,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 502))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65431))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65432))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65433))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65434))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65435))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65436))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65437))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65438))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                59,
                6,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1017))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65439))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65440))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65441))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65442))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65443))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65444))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65445))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65446))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                121,
                7,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2039))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65447))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65448))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65449))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65450))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65451))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65452))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65453))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65454))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                122,
                7,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2040))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65455))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65456))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65457))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65458))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65459))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65460))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65461))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65462))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                249,
                8,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65463))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65464))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65465))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65466))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65467))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65468))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65469))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65470))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65471))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 503))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65472))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65473))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65474))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65475))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65476))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65477))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65478))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65479))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65480))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 504))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65481))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65482))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65483))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65484))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65485))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65486))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65487))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65488))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65489))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 505))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65490))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65491))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65492))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65493))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65494))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65495))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65496))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65497))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65498))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 506))))),
                9,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65499))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65500))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65501))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65502))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65503))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65504))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65505))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65506))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65507))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 2041))))),
                11,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65508))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65509))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65510))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65511))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65512))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65513))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65514))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65515))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65516))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 16352))))),
                14,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65517))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65518))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65519))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65520))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65521))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65522))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65523))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65524))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65525))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 1018))))),
                10,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 32707))))),
                15,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65526))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65527))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65528))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65529))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65530))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65531))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65532))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65533))))),
                16,
            },
            [2]c_ushort{
                @as(c_ushort, @bitCast(@as(c_short, @truncate(@as(c_int, 65534))))),
                16,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
            [2]c_ushort{
                0,
                0,
            },
        };
    };
    const YQT = struct {
        const static: [64]c_int = [64]c_int{
            16,
            11,
            10,
            16,
            24,
            40,
            51,
            61,
            12,
            12,
            14,
            19,
            26,
            58,
            60,
            55,
            14,
            13,
            16,
            24,
            40,
            57,
            69,
            56,
            14,
            17,
            22,
            29,
            51,
            87,
            80,
            62,
            18,
            22,
            37,
            56,
            68,
            109,
            103,
            77,
            24,
            35,
            55,
            64,
            81,
            104,
            113,
            92,
            49,
            64,
            78,
            87,
            103,
            121,
            120,
            101,
            72,
            92,
            95,
            98,
            112,
            100,
            103,
            99,
        };
    };
    const UVQT = struct {
        const static: [64]c_int = [64]c_int{
            17,
            18,
            24,
            47,
            99,
            99,
            99,
            99,
            18,
            21,
            26,
            66,
            99,
            99,
            99,
            99,
            24,
            26,
            56,
            99,
            99,
            99,
            99,
            99,
            47,
            66,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
            99,
        };
    };
    const aasf = struct {
        const static: [8]f32 = [8]f32{
            1.0 * 2.8284270763397217,
            1.3870398998260498 * 2.8284270763397217,
            1.3065630197525024 * 2.8284270763397217,
            1.1758755445480347 * 2.8284270763397217,
            1.0 * 2.8284270763397217,
            0.78569495677948 * 2.8284270763397217,
            0.5411961078643799 * 2.8284270763397217,
            0.27589938044548035 * 2.8284270763397217,
        };
    };
    var row: c_int = undefined;
    var col: c_int = undefined;
    var i: c_int = undefined;
    var k: c_int = undefined;
    var subsample: c_int = undefined;
    var fdtbl_Y: [64]f32 = undefined;
    var fdtbl_UV: [64]f32 = undefined;
    var YTable: [64]u8 = undefined;
    var UVTable: [64]u8 = undefined;
    if ((((!(data != null) or !(width != 0)) or !(height != 0)) or (comp > @as(c_int, 4))) or (comp < @as(c_int, 1))) {
        return 0;
    }
    quality = if (quality != 0) quality else @as(c_int, 90);
    subsample = if (quality <= @as(c_int, 90)) @as(c_int, 1) else @as(c_int, 0);
    quality = if (quality < @as(c_int, 1)) @as(c_int, 1) else if (quality > @as(c_int, 100)) @as(c_int, 100) else quality;
    quality = if (quality < @as(c_int, 50)) @divTrunc(@as(c_int, 5000), quality) else @as(c_int, 200) - (quality * @as(c_int, 2));
    {
        i = 0;
        while (i < @as(c_int, 64)) : (i += 1) {
            var uvti: c_int = undefined;
            var yti: c_int = @divTrunc((YQT.static[@as(c_uint, @intCast(i))] * quality) + @as(c_int, 50), @as(c_int, 100));
            YTable[stbiw__jpg_ZigZag[@as(c_uint, @intCast(i))]] = @as(u8, @bitCast(@as(i8, @truncate(if (yti < @as(c_int, 1)) @as(c_int, 1) else if (yti > @as(c_int, 255)) @as(c_int, 255) else yti))));
            uvti = @divTrunc((UVQT.static[@as(c_uint, @intCast(i))] * quality) + @as(c_int, 50), @as(c_int, 100));
            UVTable[stbiw__jpg_ZigZag[@as(c_uint, @intCast(i))]] = @as(u8, @bitCast(@as(i8, @truncate(if (uvti < @as(c_int, 1)) @as(c_int, 1) else if (uvti > @as(c_int, 255)) @as(c_int, 255) else uvti))));
        }
    }
    {
        _ = blk: {
            row = 0;
            break :blk blk_1: {
                const tmp = @as(c_int, 0);
                k = tmp;
                break :blk_1 tmp;
            };
        };
        while (row < @as(c_int, 8)) : (row += 1) {
            {
                col = 0;
                while (col < @as(c_int, 8)) : (_ = blk: {
                    col += 1;
                    break :blk blk_1: {
                        const ref = &k;
                        ref.* += 1;
                        break :blk_1 ref.*;
                    };
                }) {
                    fdtbl_Y[@as(c_uint, @intCast(k))] = @as(f32, @floatFromInt(@as(c_int, 1))) / ((@as(f32, @floatFromInt(@as(c_int, @bitCast(@as(c_uint, YTable[stbiw__jpg_ZigZag[@as(c_uint, @intCast(k))]]))))) * aasf.static[@as(c_uint, @intCast(row))]) * aasf.static[@as(c_uint, @intCast(col))]);
                    fdtbl_UV[@as(c_uint, @intCast(k))] = @as(f32, @floatFromInt(@as(c_int, 1))) / ((@as(f32, @floatFromInt(@as(c_int, @bitCast(@as(c_uint, UVTable[stbiw__jpg_ZigZag[@as(c_uint, @intCast(k))]]))))) * aasf.static[@as(c_uint, @intCast(row))]) * aasf.static[@as(c_uint, @intCast(col))]);
                }
            }
        }
    }
    {
        const head0 = struct {
            const static: [25]u8 = [25]u8{
                255,
                216,
                255,
                224,
                0,
                16,
                'J',
                'F',
                'I',
                'F',
                0,
                1,
                1,
                0,
                0,
                1,
                0,
                1,
                0,
                0,
                255,
                219,
                0,
                132,
                0,
            };
        };
        const head2 = struct {
            const static: [14]u8 = [14]u8{
                255,
                218,
                0,
                12,
                3,
                1,
                0,
                2,
                17,
                3,
                17,
                0,
                63,
                0,
            };
        };
        const head1: [24]u8 = [24]u8{
            255,
            192,
            0,
            17,
            8,
            @as(u8, @bitCast(@as(i8, @truncate(height >> @intCast(8))))),
            @as(u8, @bitCast(@as(i8, @truncate(height & @as(c_int, 255))))),
            @as(u8, @bitCast(@as(i8, @truncate(width >> @intCast(8))))),
            @as(u8, @bitCast(@as(i8, @truncate(width & @as(c_int, 255))))),
            3,
            1,
            @as(u8, @bitCast(@as(i8, @truncate(if (subsample != 0) @as(c_int, 34) else @as(c_int, 17))))),
            0,
            2,
            17,
            1,
            3,
            17,
            1,
            255,
            196,
            1,
            162,
            0,
        };
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&head0.static))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([25]u8))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@as([*c]u8, @ptrCast(@alignCast(&YTable))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([64]u8))))));
        stbiw__putc(s, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 1))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@as([*c]u8, @ptrCast(@alignCast(&UVTable))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([64]u8))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&head1))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([24]u8))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_dc_luminance_nrcodes.static))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([17]u8) -% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_dc_luminance_values.static))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([12]u8))))));
        stbiw__putc(s, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 16))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_ac_luminance_nrcodes.static))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([17]u8) -% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_ac_luminance_values.static))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([162]u8))))));
        stbiw__putc(s, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 1))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_dc_chrominance_nrcodes.static))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([17]u8) -% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_dc_chrominance_values.static))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([12]u8))))));
        stbiw__putc(s, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 17))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_ac_chrominance_nrcodes.static))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1))))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([17]u8) -% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&std_ac_chrominance_values.static))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([162]u8))))));
        s.*.func.?(s.*.context, @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(@as([*c]const u8, @ptrCast(@alignCast(&head2.static))))))), @as(c_int, @bitCast(@as(c_uint, @truncate(@sizeOf([14]u8))))));
    }
    {
        const fillBits = struct {
            const static: [2]c_ushort = [2]c_ushort{
                127,
                7,
            };
        };
        var DCY: c_int = 0;
        var DCU: c_int = 0;
        var DCV: c_int = 0;
        var bitBuf: c_int = 0;
        var bitCnt: c_int = 0;
        var ofsG: c_int = if (comp > @as(c_int, 2)) @as(c_int, 1) else @as(c_int, 0);
        var ofsB: c_int = if (comp > @as(c_int, 2)) @as(c_int, 2) else @as(c_int, 0);
        var dataR: [*c]const u8 = @as([*c]const u8, @ptrCast(@alignCast(data)));
        var dataG: [*c]const u8 = dataR + @as(usize, @bitCast(@as(isize, @intCast(ofsG))));
        var dataB: [*c]const u8 = dataR + @as(usize, @bitCast(@as(isize, @intCast(ofsB))));
        var x: c_int = undefined;
        var y: c_int = undefined;
        var pos: c_int = undefined;
        if (subsample != 0) {
            {
                y = 0;
                while (y < height) : (y += @as(c_int, 16)) {
                    {
                        x = 0;
                        while (x < width) : (x += @as(c_int, 16)) {
                            var Y: [256]f32 = undefined;
                            var U: [256]f32 = undefined;
                            var V: [256]f32 = undefined;
                            {
                                _ = blk: {
                                    row = y;
                                    break :blk blk_1: {
                                        const tmp = @as(c_int, 0);
                                        pos = tmp;
                                        break :blk_1 tmp;
                                    };
                                };
                                while (row < (y + @as(c_int, 16))) : (row += 1) {
                                    var clamped_row: c_int = if (row < height) row else height - @as(c_int, 1);
                                    var base_p: c_int = ((if (stbi__flip_vertically_on_write != 0) (height - @as(c_int, 1)) - clamped_row else clamped_row) * width) * comp;
                                    {
                                        col = x;
                                        while (col < (x + @as(c_int, 16))) : (_ = blk: {
                                            col += 1;
                                            break :blk blk_1: {
                                                const ref = &pos;
                                                ref.* += 1;
                                                break :blk_1 ref.*;
                                            };
                                        }) {
                                            var p: c_int = base_p + ((if (col < width) col else width - @as(c_int, 1)) * comp);
                                            var r: f32 = @as(f32, @floatFromInt((blk: {
                                                const tmp = p;
                                                if (tmp >= 0) break :blk dataR + @as(usize, @intCast(tmp)) else break :blk dataR - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                                            }).*));
                                            var g: f32 = @as(f32, @floatFromInt((blk: {
                                                const tmp = p;
                                                if (tmp >= 0) break :blk dataG + @as(usize, @intCast(tmp)) else break :blk dataG - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                                            }).*));
                                            var b: f32 = @as(f32, @floatFromInt((blk: {
                                                const tmp = p;
                                                if (tmp >= 0) break :blk dataB + @as(usize, @intCast(tmp)) else break :blk dataB - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                                            }).*));
                                            Y[@as(c_uint, @intCast(pos))] = (((0.29899999499320984 * r) + (0.5870000123977661 * g)) + (0.11400000005960464 * b)) - @as(f32, @floatFromInt(@as(c_int, 128)));
                                            U[@as(c_uint, @intCast(pos))] = ((-0.16874000430107117 * r) - (0.33125999569892883 * g)) + (0.5 * b);
                                            V[@as(c_uint, @intCast(pos))] = ((0.5 * r) - (0.4186899960041046 * g)) - (0.08130999654531479 * b);
                                        }
                                    }
                                }
                            }
                            DCY = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&Y))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 0))))), @as(c_int, 16), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_Y))), DCY, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YAC_HT.static))));
                            DCY = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&Y))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 8))))), @as(c_int, 16), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_Y))), DCY, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YAC_HT.static))));
                            DCY = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&Y))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 128))))), @as(c_int, 16), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_Y))), DCY, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YAC_HT.static))));
                            DCY = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&Y))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 136))))), @as(c_int, 16), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_Y))), DCY, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YAC_HT.static))));
                            {
                                var subU: [64]f32 = undefined;
                                var subV: [64]f32 = undefined;
                                var yy: c_int = undefined;
                                var xx: c_int = undefined;
                                {
                                    _ = blk: {
                                        yy = 0;
                                        break :blk blk_1: {
                                            const tmp = @as(c_int, 0);
                                            pos = tmp;
                                            break :blk_1 tmp;
                                        };
                                    };
                                    while (yy < @as(c_int, 8)) : (yy += 1) {
                                        {
                                            xx = 0;
                                            while (xx < @as(c_int, 8)) : (_ = blk: {
                                                xx += 1;
                                                break :blk blk_1: {
                                                    const ref = &pos;
                                                    ref.* += 1;
                                                    break :blk_1 ref.*;
                                                };
                                            }) {
                                                var j: c_int = (yy * @as(c_int, 32)) + (xx * @as(c_int, 2));
                                                subU[@as(c_uint, @intCast(pos))] = (((U[@as(c_uint, @intCast(j + @as(c_int, 0)))] + U[@as(c_uint, @intCast(j + @as(c_int, 1)))]) + U[@as(c_uint, @intCast(j + @as(c_int, 16)))]) + U[@as(c_uint, @intCast(j + @as(c_int, 17)))]) * 0.25;
                                                subV[@as(c_uint, @intCast(pos))] = (((V[@as(c_uint, @intCast(j + @as(c_int, 0)))] + V[@as(c_uint, @intCast(j + @as(c_int, 1)))]) + V[@as(c_uint, @intCast(j + @as(c_int, 16)))]) + V[@as(c_uint, @intCast(j + @as(c_int, 17)))]) * 0.25;
                                            }
                                        }
                                    }
                                }
                                DCU = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&subU))), @as(c_int, 8), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_UV))), DCU, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVAC_HT.static))));
                                DCV = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&subV))), @as(c_int, 8), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_UV))), DCV, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVAC_HT.static))));
                            }
                        }
                    }
                }
            }
        } else {
            {
                y = 0;
                while (y < height) : (y += @as(c_int, 8)) {
                    {
                        x = 0;
                        while (x < width) : (x += @as(c_int, 8)) {
                            var Y: [64]f32 = undefined;
                            var U: [64]f32 = undefined;
                            var V: [64]f32 = undefined;
                            {
                                _ = blk: {
                                    row = y;
                                    break :blk blk_1: {
                                        const tmp = @as(c_int, 0);
                                        pos = tmp;
                                        break :blk_1 tmp;
                                    };
                                };
                                while (row < (y + @as(c_int, 8))) : (row += 1) {
                                    var clamped_row: c_int = if (row < height) row else height - @as(c_int, 1);
                                    var base_p: c_int = ((if (stbi__flip_vertically_on_write != 0) (height - @as(c_int, 1)) - clamped_row else clamped_row) * width) * comp;
                                    {
                                        col = x;
                                        while (col < (x + @as(c_int, 8))) : (_ = blk: {
                                            col += 1;
                                            break :blk blk_1: {
                                                const ref = &pos;
                                                ref.* += 1;
                                                break :blk_1 ref.*;
                                            };
                                        }) {
                                            var p: c_int = base_p + ((if (col < width) col else width - @as(c_int, 1)) * comp);
                                            var r: f32 = @as(f32, @floatFromInt((blk: {
                                                const tmp = p;
                                                if (tmp >= 0) break :blk dataR + @as(usize, @intCast(tmp)) else break :blk dataR - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                                            }).*));
                                            var g: f32 = @as(f32, @floatFromInt((blk: {
                                                const tmp = p;
                                                if (tmp >= 0) break :blk dataG + @as(usize, @intCast(tmp)) else break :blk dataG - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                                            }).*));
                                            var b: f32 = @as(f32, @floatFromInt((blk: {
                                                const tmp = p;
                                                if (tmp >= 0) break :blk dataB + @as(usize, @intCast(tmp)) else break :blk dataB - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
                                            }).*));
                                            Y[@as(c_uint, @intCast(pos))] = (((0.29899999499320984 * r) + (0.5870000123977661 * g)) + (0.11400000005960464 * b)) - @as(f32, @floatFromInt(@as(c_int, 128)));
                                            U[@as(c_uint, @intCast(pos))] = ((-0.16874000430107117 * r) - (0.33125999569892883 * g)) + (0.5 * b);
                                            V[@as(c_uint, @intCast(pos))] = ((0.5 * r) - (0.4186899960041046 * g)) - (0.08130999654531479 * b);
                                        }
                                    }
                                }
                            }
                            DCY = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&Y))), @as(c_int, 8), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_Y))), DCY, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&YAC_HT.static))));
                            DCU = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&U))), @as(c_int, 8), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_UV))), DCU, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVAC_HT.static))));
                            DCV = stbiw__jpg_processDU(s, &bitBuf, &bitCnt, @as([*c]f32, @ptrCast(@alignCast(&V))), @as(c_int, 8), @as([*c]f32, @ptrCast(@alignCast(&fdtbl_UV))), DCV, @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVDC_HT.static))), @as([*c]const [2]c_ushort, @ptrCast(@alignCast(&UVAC_HT.static))));
                        }
                    }
                }
            }
        }
        stbiw__jpg_writeBits(s, &bitBuf, &bitCnt, @as([*c]const c_ushort, @ptrCast(@alignCast(&fillBits.static))));
    }
    stbiw__putc(s, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 255))))));
    stbiw__putc(s, @as(u8, @bitCast(@as(i8, @truncate(@as(c_int, 217))))));
    return 1;
}
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):81:9
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):87:9
pub const __FLT16_DENORM_MIN__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):110:9
pub const __FLT16_EPSILON__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):114:9
pub const __FLT16_MAX__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):120:9
pub const __FLT16_MIN__ = @compileError("unable to translate C expr: unexpected token 'IntegerLiteral'"); // (no file):123:9
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`"); // (no file):184:9
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`"); // (no file):206:9
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`"); // (no file):214:9
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):341:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // (no file):342:9
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`"); // /usr/include/features.h:186:9
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:45:10
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:55:10
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:82:11
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:124:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:125:9
pub const __glibc_unsigned_or_positive = @compileError("unable to translate macro: undefined identifier `__typeof`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:160:9
pub const __glibc_fortify = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:185:9
pub const __glibc_fortify_n = @compileError("unable to translate C expr: expected ')' instead got '...'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:195:9
pub const __warnattr = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:207:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:208:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:216:10
pub const __REDIRECT = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:247:10
pub const __REDIRECT_NTH = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:254:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate macro: undefined identifier `__asm__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:256:11
pub const __ASMNAME2 = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:260:10
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:281:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:292:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:298:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:308:10
pub const __attribute_const__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:315:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:321:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:330:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:331:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:339:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:349:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:362:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:372:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:384:11
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:397:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:406:10
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__inline`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:424:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:433:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__inline`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:451:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:452:11
pub const __restrict_arr = @compileError("unable to translate macro: undefined identifier `__restrict`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:495:10
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:544:10
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:620:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:621:10
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:635:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:636:10
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:681:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:682:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:683:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:693:10
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/x86_64-linux-gnu/sys/cdefs.h:700:10
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:178:13
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`"); // /usr/include/x86_64-linux-gnu/bits/floatn-common.h:292:13
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'"); // /usr/include/x86_64-linux-gnu/bits/types.h:137:10
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`"); // /usr/include/x86_64-linux-gnu/bits/typesizes.h:73:9
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`"); // /usr/include/x86_64-linux-gnu/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='"); // /usr/include/x86_64-linux-gnu/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='"); // /usr/include/x86_64-linux-gnu/bits/select.h:34:9
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/x86_64-linux-gnu/bits/struct_mutex.h:56:10
pub const __PTHREAD_RWLOCK_ELISION_EXTRA = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/x86_64-linux-gnu/bits/struct_rwlock.h:40:11
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'"); // /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:113:9
pub const STBIWDEF = @compileError("unable to translate C expr: unexpected token 'extern'"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:164:9
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr"); // /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h:102:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr"); // /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h:106:9
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`"); // /home/calion/Downloads/lib/include/stdarg.h:33:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`"); // /home/calion/Downloads/lib/include/stdarg.h:35:9
pub const va_arg = @compileError("unable to translate macro: undefined identifier `__builtin_va_arg`"); // /home/calion/Downloads/lib/include/stdarg.h:36:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /home/calion/Downloads/lib/include/stdarg.h:41:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`"); // /home/calion/Downloads/lib/include/stdarg.h:46:9
pub const HUGE_VAL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`"); // /usr/include/math.h:48:10
pub const HUGE_VALL = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`"); // /usr/include/math.h:60:11
pub const __GLIBC_FLT_EVAL_METHOD = @compileError("unable to translate macro: undefined identifier `__FLT_EVAL_METHOD__`"); // /usr/include/x86_64-linux-gnu/bits/flt-eval-method.h:27:11
pub const __SIMD_DECL = @compileError("unable to translate macro: undefined identifier `__DECL_SIMD_`"); // /usr/include/math.h:276:9
pub const __MATHCALL_VEC = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /usr/include/math.h:278:9
pub const __MATHDECL_VEC = @compileError("unable to translate C expr: unexpected token 'Identifier'"); // /usr/include/math.h:282:9
pub const __MATHDECL = @compileError("unable to translate macro: undefined identifier `__`"); // /usr/include/math.h:288:9
pub const __MATHDECLX = @compileError("unable to translate macro: undefined identifier `__attribute__`"); // /usr/include/math.h:293:9
pub const __MATHDECL_1_IMPL = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include/math.h:296:9
pub const __MATHREDIR = @compileError("unable to translate C expr: unexpected token 'extern'"); // /usr/include/math.h:305:9
pub const __MATHCALL_NARROW_ARGS_1 = @compileError("unable to translate macro: undefined identifier `_Marg_`"); // /usr/include/math.h:550:9
pub const __MATHCALL_NARROW_ARGS_2 = @compileError("unable to translate macro: undefined identifier `_Marg_`"); // /usr/include/math.h:551:9
pub const __MATHCALL_NARROW_ARGS_3 = @compileError("unable to translate macro: undefined identifier `_Marg_`"); // /usr/include/math.h:552:9
pub const __MATHCALL_NARROW_NORMAL = @compileError("unable to translate macro: undefined identifier `_Mret_`"); // /usr/include/math.h:553:9
pub const __MATHCALL_NARROW_REDIR = @compileError("unable to translate macro: undefined identifier `_Mret_`"); // /usr/include/math.h:555:9
pub const __MATH_TG = @compileError("unable to translate macro: undefined identifier `f`"); // /usr/include/math.h:922:10
pub const fpclassify = @compileError("unable to translate macro: undefined identifier `__builtin_fpclassify`"); // /usr/include/math.h:967:11
pub const isfinite = @compileError("unable to translate macro: undefined identifier `__builtin_isfinite`"); // /usr/include/math.h:994:11
pub const isnormal = @compileError("unable to translate macro: undefined identifier `__builtin_isnormal`"); // /usr/include/math.h:1002:11
pub const isgreater = @compileError("unable to translate macro: undefined identifier `__builtin_isgreater`"); // /usr/include/math.h:1305:11
pub const isgreaterequal = @compileError("unable to translate macro: undefined identifier `__builtin_isgreaterequal`"); // /usr/include/math.h:1306:11
pub const isless = @compileError("unable to translate macro: undefined identifier `__builtin_isless`"); // /usr/include/math.h:1307:11
pub const islessequal = @compileError("unable to translate macro: undefined identifier `__builtin_islessequal`"); // /usr/include/math.h:1308:11
pub const islessgreater = @compileError("unable to translate macro: undefined identifier `__builtin_islessgreater`"); // /usr/include/math.h:1309:11
pub const isunordered = @compileError("unable to translate macro: undefined identifier `__builtin_isunordered`"); // /usr/include/math.h:1310:11
pub const __ASSERT_VOID_CAST = @compileError("unable to translate C expr: unexpected token 'Eof'"); // /usr/include/assert.h:40:10
pub const static_assert = @compileError("unable to translate C expr: unexpected token '_Static_assert'"); // /usr/include/assert.h:143:10
pub const stbiw__sbgrow = @compileError("unable to translate C expr: expected ')' instead got '*'"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:810:9
pub const stbiw__sbpush = @compileError("TODO postfix inc/dec expr"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:812:9
pub const stbiw__sbfree = @compileError("unable to translate C expr: expected ':' instead got ','"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:814:9
pub const stbiw__zlib_flush = @compileError("unable to translate macro: undefined identifier `out`"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:869:9
pub const stbiw__zlib_add = @compileError("unable to translate macro: undefined identifier `bitbuf`"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:870:9
pub const stbiw__wpng4 = @compileError("unable to translate C expr: expected ')' instead got '='"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:1063:9
pub const stbiw__wp32 = @compileError("unable to translate C expr: unexpected token ';'"); // /home/calion/Desktop/Aslion/src/stb_image_write.h:1064:9
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 16);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 6);
pub const __clang_version__ = "16.0.6 (https://github.com/ziglang/zig-bootstrap 1dda86241204c4649f668d46b6a37feed707c7b4)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 16.0.6 (https://github.com/ziglang/zig-bootstrap 1dda86241204c4649f668d46b6a37feed707c7b4)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __OPTIMIZE__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __znver3 = @as(c_int, 1);
pub const __znver3__ = @as(c_int, 1);
pub const __tune_znver3__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __ELF__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __GLIBC_MINOR__ = @as(c_int, 19);
pub const NDEBUG = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const STB_IMAGE_WRITE_IMPLEMENTATION = "";
pub const INCLUDE_STB_IMAGE_WRITE_H = "";
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2X = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    return __has_builtin(name);
}
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub inline fn __P(args: anytype) @TypeOf(args) {
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    return args;
}
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    return __bos(__o);
}
pub inline fn __glibc_safe_len_cond(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(__l <= @import("std").zig.c_translation.MacroArithmetic.div(__osz, __s)) {
    return __l <= @import("std").zig.c_translation.MacroArithmetic.div(__osz, __s);
}
pub inline fn __glibc_safe_or_unknown_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0)) {
    return ((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0);
}
pub inline fn __glibc_unsafe_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0)) {
    return ((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0);
}
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub inline fn __ASMNAME(cname: anytype) @TypeOf(__ASMNAME2(__USER_LABEL_PREFIX__, cname)) {
    return __ASMNAME2(__USER_LABEL_PREFIX__, cname);
}
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    return __attribute_nonnull__(params);
}
pub const __wur = "";
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = @TypeOf(alias);
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = @TypeOf(alias);
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    return name ++ proto ++ __THROW;
}
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __attr_dealloc_free = "";
pub const __USE_EXTERN_INLINES = @as(c_int, 1);
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const __need_size_t = "";
pub const __need_wchar_t = "";
pub const __need_NULL = "";
pub const _SIZE_T = "";
pub const _WCHAR_T = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _STDLIB_H = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 1);
pub const WUNTRACED = @as(c_int, 2);
pub const WSTOPPED = @as(c_int, 2);
pub const WEXITED = @as(c_int, 4);
pub const WCONTINUED = @as(c_int, 8);
pub const WNOWAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hexadecimal);
pub const __WNOTHREAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hexadecimal);
pub const __WALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hexadecimal);
pub const __WCLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hexadecimal);
pub inline fn __WEXITSTATUS(status: anytype) @TypeOf((status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hexadecimal)) >> @as(c_int, 8)) {
    return (status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hexadecimal)) >> @as(c_int, 8);
}
pub inline fn __WTERMSIG(status: anytype) @TypeOf(status & @as(c_int, 0x7f)) {
    return status & @as(c_int, 0x7f);
}
pub inline fn __WSTOPSIG(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    return __WEXITSTATUS(status);
}
pub inline fn __WIFEXITED(status: anytype) @TypeOf(__WTERMSIG(status) == @as(c_int, 0)) {
    return __WTERMSIG(status) == @as(c_int, 0);
}
pub inline fn __WIFSIGNALED(status: anytype) @TypeOf((@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0)) {
    return (@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0);
}
pub inline fn __WIFSTOPPED(status: anytype) @TypeOf((status & @as(c_int, 0xff)) == @as(c_int, 0x7f)) {
    return (status & @as(c_int, 0xff)) == @as(c_int, 0x7f);
}
pub inline fn __WIFCONTINUED(status: anytype) @TypeOf(status == __W_CONTINUED) {
    return status == __W_CONTINUED;
}
pub inline fn __WCOREDUMP(status: anytype) @TypeOf(status & __WCOREFLAG) {
    return status & __WCOREFLAG;
}
pub inline fn __W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn __W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | @as(c_int, 0x7f)) {
    return (sig << @as(c_int, 8)) | @as(c_int, 0x7f);
}
pub const __W_CONTINUED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hexadecimal);
pub const __WCOREFLAG = @as(c_int, 0x80);
pub inline fn WEXITSTATUS(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    return __WEXITSTATUS(status);
}
pub inline fn WTERMSIG(status: anytype) @TypeOf(__WTERMSIG(status)) {
    return __WTERMSIG(status);
}
pub inline fn WSTOPSIG(status: anytype) @TypeOf(__WSTOPSIG(status)) {
    return __WSTOPSIG(status);
}
pub inline fn WIFEXITED(status: anytype) @TypeOf(__WIFEXITED(status)) {
    return __WIFEXITED(status);
}
pub inline fn WIFSIGNALED(status: anytype) @TypeOf(__WIFSIGNALED(status)) {
    return __WIFSIGNALED(status);
}
pub inline fn WIFSTOPPED(status: anytype) @TypeOf(__WIFSTOPPED(status)) {
    return __WIFSTOPPED(status);
}
pub inline fn WIFCONTINUED(status: anytype) @TypeOf(__WIFCONTINUED(status)) {
    return __WIFCONTINUED(status);
}
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 0);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    return __builtin_nanf(x);
}
pub const __ldiv_t_defined = @as(c_int, 1);
pub const __lldiv_t_defined = @as(c_int, 1);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const MB_CUR_MAX = __ctype_get_mb_cur_max();
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __mode_t_defined = "";
pub const __nlink_t_defined = "";
pub const __uid_t_defined = "";
pub const __off_t_defined = "";
pub const __pid_t_defined = "";
pub const __id_t_defined = "";
pub const __ssize_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __time_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    return blk: {
        _ = @TypeOf(LO);
        break :blk HI;
    };
}
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    return @import("std").zig.c_translation.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hexadecimal)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hexadecimal)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    return ((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hexadecimal)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hexadecimal)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    return __uint64_identity(x);
}
pub const _SYS_SELECT_H = @as(c_int, 1);
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0)) {
    return (__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = @import("std").zig.c_translation.MacroArithmetic.div(@as(c_int, 1024), @as(c_int, 8) * @import("std").zig.c_translation.sizeof(c_ulong));
pub const __timeval_defined = @as(c_int, 1);
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const __NFDBITS = @as(c_int, 8) * @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS)) {
    return @import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    return @import("std").zig.c_translation.cast(__fd_mask, @as(c_ulong, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.__fds_bits) {
    return set.*.__fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    return __FD_ZERO(fdsetp);
}
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 40);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 4);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const _RWLOCK_INTERNAL_H = "";
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @TypeOf(__PTHREAD_RWLOCK_ELISION_EXTRA);
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const _ALLOCA_H = @as(c_int, 1);
pub const __COMPAR_FN_T = "";
pub const _STDIO_H = @as(c_int, 1);
pub const __need___va_list = "";
pub const __GNUC_VA_LIST = "";
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hexadecimal);
pub const _VA_LIST_DEFINED = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const P_tmpdir = "/tmp";
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 238328, .decimal);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const _BITS_STDIO_H = @as(c_int, 1);
pub const __STDIO_INLINE = __extern_inline;
pub const __STDARG_H = "";
pub const _VA_LIST = "";
pub const _STRING_H = @as(c_int, 1);
pub const _BITS_TYPES_LOCALE_T_H = @as(c_int, 1);
pub const _BITS_TYPES___LOCALE_T_H = @as(c_int, 1);
pub const _STRINGS_H = @as(c_int, 1);
pub const _MATH_H = @as(c_int, 1);
pub const _BITS_LIBM_SIMD_DECL_STUBS_H = @as(c_int, 1);
pub const __DECL_SIMD_cos = "";
pub const __DECL_SIMD_cosf = "";
pub const __DECL_SIMD_cosl = "";
pub const __DECL_SIMD_cosf16 = "";
pub const __DECL_SIMD_cosf32 = "";
pub const __DECL_SIMD_cosf64 = "";
pub const __DECL_SIMD_cosf128 = "";
pub const __DECL_SIMD_cosf32x = "";
pub const __DECL_SIMD_cosf64x = "";
pub const __DECL_SIMD_cosf128x = "";
pub const __DECL_SIMD_sin = "";
pub const __DECL_SIMD_sinf = "";
pub const __DECL_SIMD_sinl = "";
pub const __DECL_SIMD_sinf16 = "";
pub const __DECL_SIMD_sinf32 = "";
pub const __DECL_SIMD_sinf64 = "";
pub const __DECL_SIMD_sinf128 = "";
pub const __DECL_SIMD_sinf32x = "";
pub const __DECL_SIMD_sinf64x = "";
pub const __DECL_SIMD_sinf128x = "";
pub const __DECL_SIMD_sincos = "";
pub const __DECL_SIMD_sincosf = "";
pub const __DECL_SIMD_sincosl = "";
pub const __DECL_SIMD_sincosf16 = "";
pub const __DECL_SIMD_sincosf32 = "";
pub const __DECL_SIMD_sincosf64 = "";
pub const __DECL_SIMD_sincosf128 = "";
pub const __DECL_SIMD_sincosf32x = "";
pub const __DECL_SIMD_sincosf64x = "";
pub const __DECL_SIMD_sincosf128x = "";
pub const __DECL_SIMD_log = "";
pub const __DECL_SIMD_logf = "";
pub const __DECL_SIMD_logl = "";
pub const __DECL_SIMD_logf16 = "";
pub const __DECL_SIMD_logf32 = "";
pub const __DECL_SIMD_logf64 = "";
pub const __DECL_SIMD_logf128 = "";
pub const __DECL_SIMD_logf32x = "";
pub const __DECL_SIMD_logf64x = "";
pub const __DECL_SIMD_logf128x = "";
pub const __DECL_SIMD_exp = "";
pub const __DECL_SIMD_expf = "";
pub const __DECL_SIMD_expl = "";
pub const __DECL_SIMD_expf16 = "";
pub const __DECL_SIMD_expf32 = "";
pub const __DECL_SIMD_expf64 = "";
pub const __DECL_SIMD_expf128 = "";
pub const __DECL_SIMD_expf32x = "";
pub const __DECL_SIMD_expf64x = "";
pub const __DECL_SIMD_expf128x = "";
pub const __DECL_SIMD_pow = "";
pub const __DECL_SIMD_powf = "";
pub const __DECL_SIMD_powl = "";
pub const __DECL_SIMD_powf16 = "";
pub const __DECL_SIMD_powf32 = "";
pub const __DECL_SIMD_powf64 = "";
pub const __DECL_SIMD_powf128 = "";
pub const __DECL_SIMD_powf32x = "";
pub const __DECL_SIMD_powf64x = "";
pub const __DECL_SIMD_powf128x = "";
pub const __DECL_SIMD_acos = "";
pub const __DECL_SIMD_acosf = "";
pub const __DECL_SIMD_acosl = "";
pub const __DECL_SIMD_acosf16 = "";
pub const __DECL_SIMD_acosf32 = "";
pub const __DECL_SIMD_acosf64 = "";
pub const __DECL_SIMD_acosf128 = "";
pub const __DECL_SIMD_acosf32x = "";
pub const __DECL_SIMD_acosf64x = "";
pub const __DECL_SIMD_acosf128x = "";
pub const __DECL_SIMD_atan = "";
pub const __DECL_SIMD_atanf = "";
pub const __DECL_SIMD_atanl = "";
pub const __DECL_SIMD_atanf16 = "";
pub const __DECL_SIMD_atanf32 = "";
pub const __DECL_SIMD_atanf64 = "";
pub const __DECL_SIMD_atanf128 = "";
pub const __DECL_SIMD_atanf32x = "";
pub const __DECL_SIMD_atanf64x = "";
pub const __DECL_SIMD_atanf128x = "";
pub const __DECL_SIMD_asin = "";
pub const __DECL_SIMD_asinf = "";
pub const __DECL_SIMD_asinl = "";
pub const __DECL_SIMD_asinf16 = "";
pub const __DECL_SIMD_asinf32 = "";
pub const __DECL_SIMD_asinf64 = "";
pub const __DECL_SIMD_asinf128 = "";
pub const __DECL_SIMD_asinf32x = "";
pub const __DECL_SIMD_asinf64x = "";
pub const __DECL_SIMD_asinf128x = "";
pub const __DECL_SIMD_hypot = "";
pub const __DECL_SIMD_hypotf = "";
pub const __DECL_SIMD_hypotl = "";
pub const __DECL_SIMD_hypotf16 = "";
pub const __DECL_SIMD_hypotf32 = "";
pub const __DECL_SIMD_hypotf64 = "";
pub const __DECL_SIMD_hypotf128 = "";
pub const __DECL_SIMD_hypotf32x = "";
pub const __DECL_SIMD_hypotf64x = "";
pub const __DECL_SIMD_hypotf128x = "";
pub const __DECL_SIMD_exp2 = "";
pub const __DECL_SIMD_exp2f = "";
pub const __DECL_SIMD_exp2l = "";
pub const __DECL_SIMD_exp2f16 = "";
pub const __DECL_SIMD_exp2f32 = "";
pub const __DECL_SIMD_exp2f64 = "";
pub const __DECL_SIMD_exp2f128 = "";
pub const __DECL_SIMD_exp2f32x = "";
pub const __DECL_SIMD_exp2f64x = "";
pub const __DECL_SIMD_exp2f128x = "";
pub const __DECL_SIMD_exp10 = "";
pub const __DECL_SIMD_exp10f = "";
pub const __DECL_SIMD_exp10l = "";
pub const __DECL_SIMD_exp10f16 = "";
pub const __DECL_SIMD_exp10f32 = "";
pub const __DECL_SIMD_exp10f64 = "";
pub const __DECL_SIMD_exp10f128 = "";
pub const __DECL_SIMD_exp10f32x = "";
pub const __DECL_SIMD_exp10f64x = "";
pub const __DECL_SIMD_exp10f128x = "";
pub const __DECL_SIMD_cosh = "";
pub const __DECL_SIMD_coshf = "";
pub const __DECL_SIMD_coshl = "";
pub const __DECL_SIMD_coshf16 = "";
pub const __DECL_SIMD_coshf32 = "";
pub const __DECL_SIMD_coshf64 = "";
pub const __DECL_SIMD_coshf128 = "";
pub const __DECL_SIMD_coshf32x = "";
pub const __DECL_SIMD_coshf64x = "";
pub const __DECL_SIMD_coshf128x = "";
pub const __DECL_SIMD_expm1 = "";
pub const __DECL_SIMD_expm1f = "";
pub const __DECL_SIMD_expm1l = "";
pub const __DECL_SIMD_expm1f16 = "";
pub const __DECL_SIMD_expm1f32 = "";
pub const __DECL_SIMD_expm1f64 = "";
pub const __DECL_SIMD_expm1f128 = "";
pub const __DECL_SIMD_expm1f32x = "";
pub const __DECL_SIMD_expm1f64x = "";
pub const __DECL_SIMD_expm1f128x = "";
pub const __DECL_SIMD_sinh = "";
pub const __DECL_SIMD_sinhf = "";
pub const __DECL_SIMD_sinhl = "";
pub const __DECL_SIMD_sinhf16 = "";
pub const __DECL_SIMD_sinhf32 = "";
pub const __DECL_SIMD_sinhf64 = "";
pub const __DECL_SIMD_sinhf128 = "";
pub const __DECL_SIMD_sinhf32x = "";
pub const __DECL_SIMD_sinhf64x = "";
pub const __DECL_SIMD_sinhf128x = "";
pub const __DECL_SIMD_cbrt = "";
pub const __DECL_SIMD_cbrtf = "";
pub const __DECL_SIMD_cbrtl = "";
pub const __DECL_SIMD_cbrtf16 = "";
pub const __DECL_SIMD_cbrtf32 = "";
pub const __DECL_SIMD_cbrtf64 = "";
pub const __DECL_SIMD_cbrtf128 = "";
pub const __DECL_SIMD_cbrtf32x = "";
pub const __DECL_SIMD_cbrtf64x = "";
pub const __DECL_SIMD_cbrtf128x = "";
pub const __DECL_SIMD_atan2 = "";
pub const __DECL_SIMD_atan2f = "";
pub const __DECL_SIMD_atan2l = "";
pub const __DECL_SIMD_atan2f16 = "";
pub const __DECL_SIMD_atan2f32 = "";
pub const __DECL_SIMD_atan2f64 = "";
pub const __DECL_SIMD_atan2f128 = "";
pub const __DECL_SIMD_atan2f32x = "";
pub const __DECL_SIMD_atan2f64x = "";
pub const __DECL_SIMD_atan2f128x = "";
pub const __DECL_SIMD_log10 = "";
pub const __DECL_SIMD_log10f = "";
pub const __DECL_SIMD_log10l = "";
pub const __DECL_SIMD_log10f16 = "";
pub const __DECL_SIMD_log10f32 = "";
pub const __DECL_SIMD_log10f64 = "";
pub const __DECL_SIMD_log10f128 = "";
pub const __DECL_SIMD_log10f32x = "";
pub const __DECL_SIMD_log10f64x = "";
pub const __DECL_SIMD_log10f128x = "";
pub const __DECL_SIMD_log2 = "";
pub const __DECL_SIMD_log2f = "";
pub const __DECL_SIMD_log2l = "";
pub const __DECL_SIMD_log2f16 = "";
pub const __DECL_SIMD_log2f32 = "";
pub const __DECL_SIMD_log2f64 = "";
pub const __DECL_SIMD_log2f128 = "";
pub const __DECL_SIMD_log2f32x = "";
pub const __DECL_SIMD_log2f64x = "";
pub const __DECL_SIMD_log2f128x = "";
pub const __DECL_SIMD_log1p = "";
pub const __DECL_SIMD_log1pf = "";
pub const __DECL_SIMD_log1pl = "";
pub const __DECL_SIMD_log1pf16 = "";
pub const __DECL_SIMD_log1pf32 = "";
pub const __DECL_SIMD_log1pf64 = "";
pub const __DECL_SIMD_log1pf128 = "";
pub const __DECL_SIMD_log1pf32x = "";
pub const __DECL_SIMD_log1pf64x = "";
pub const __DECL_SIMD_log1pf128x = "";
pub const __DECL_SIMD_atanh = "";
pub const __DECL_SIMD_atanhf = "";
pub const __DECL_SIMD_atanhl = "";
pub const __DECL_SIMD_atanhf16 = "";
pub const __DECL_SIMD_atanhf32 = "";
pub const __DECL_SIMD_atanhf64 = "";
pub const __DECL_SIMD_atanhf128 = "";
pub const __DECL_SIMD_atanhf32x = "";
pub const __DECL_SIMD_atanhf64x = "";
pub const __DECL_SIMD_atanhf128x = "";
pub const __DECL_SIMD_acosh = "";
pub const __DECL_SIMD_acoshf = "";
pub const __DECL_SIMD_acoshl = "";
pub const __DECL_SIMD_acoshf16 = "";
pub const __DECL_SIMD_acoshf32 = "";
pub const __DECL_SIMD_acoshf64 = "";
pub const __DECL_SIMD_acoshf128 = "";
pub const __DECL_SIMD_acoshf32x = "";
pub const __DECL_SIMD_acoshf64x = "";
pub const __DECL_SIMD_acoshf128x = "";
pub const __DECL_SIMD_erf = "";
pub const __DECL_SIMD_erff = "";
pub const __DECL_SIMD_erfl = "";
pub const __DECL_SIMD_erff16 = "";
pub const __DECL_SIMD_erff32 = "";
pub const __DECL_SIMD_erff64 = "";
pub const __DECL_SIMD_erff128 = "";
pub const __DECL_SIMD_erff32x = "";
pub const __DECL_SIMD_erff64x = "";
pub const __DECL_SIMD_erff128x = "";
pub const __DECL_SIMD_tanh = "";
pub const __DECL_SIMD_tanhf = "";
pub const __DECL_SIMD_tanhl = "";
pub const __DECL_SIMD_tanhf16 = "";
pub const __DECL_SIMD_tanhf32 = "";
pub const __DECL_SIMD_tanhf64 = "";
pub const __DECL_SIMD_tanhf128 = "";
pub const __DECL_SIMD_tanhf32x = "";
pub const __DECL_SIMD_tanhf64x = "";
pub const __DECL_SIMD_tanhf128x = "";
pub const __DECL_SIMD_asinh = "";
pub const __DECL_SIMD_asinhf = "";
pub const __DECL_SIMD_asinhl = "";
pub const __DECL_SIMD_asinhf16 = "";
pub const __DECL_SIMD_asinhf32 = "";
pub const __DECL_SIMD_asinhf64 = "";
pub const __DECL_SIMD_asinhf128 = "";
pub const __DECL_SIMD_asinhf32x = "";
pub const __DECL_SIMD_asinhf64x = "";
pub const __DECL_SIMD_asinhf128x = "";
pub const __DECL_SIMD_erfc = "";
pub const __DECL_SIMD_erfcf = "";
pub const __DECL_SIMD_erfcl = "";
pub const __DECL_SIMD_erfcf16 = "";
pub const __DECL_SIMD_erfcf32 = "";
pub const __DECL_SIMD_erfcf64 = "";
pub const __DECL_SIMD_erfcf128 = "";
pub const __DECL_SIMD_erfcf32x = "";
pub const __DECL_SIMD_erfcf64x = "";
pub const __DECL_SIMD_erfcf128x = "";
pub const __DECL_SIMD_tan = "";
pub const __DECL_SIMD_tanf = "";
pub const __DECL_SIMD_tanl = "";
pub const __DECL_SIMD_tanf16 = "";
pub const __DECL_SIMD_tanf32 = "";
pub const __DECL_SIMD_tanf64 = "";
pub const __DECL_SIMD_tanf128 = "";
pub const __DECL_SIMD_tanf32x = "";
pub const __DECL_SIMD_tanf64x = "";
pub const __DECL_SIMD_tanf128x = "";
pub const HUGE_VALF = __builtin_huge_valf();
pub const INFINITY = __builtin_inff();
pub const NAN = __builtin_nanf("");
pub const __FP_LOGB0_IS_MIN = @as(c_int, 1);
pub const __FP_LOGBNAN_IS_MIN = @as(c_int, 1);
pub const FP_ILOGB0 = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const FP_ILOGBNAN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub inline fn __MATHCALL(function: anytype, suffix: anytype, args: anytype) @TypeOf(__MATHDECL(_Mdouble_, function, suffix, args)) {
    return __MATHDECL(_Mdouble_, function, suffix, args);
}
pub inline fn __MATHCALLX(function: anytype, suffix: anytype, args: anytype, attrib: anytype) @TypeOf(__MATHDECLX(_Mdouble_, function, suffix, args, attrib)) {
    return __MATHDECLX(_Mdouble_, function, suffix, args, attrib);
}
pub inline fn __MATHDECL_1(@"type": anytype, function: anytype, suffix: anytype, args: anytype) @TypeOf(__MATHDECL_1_IMPL(@"type", function, suffix, args)) {
    return __MATHDECL_1_IMPL(@"type", function, suffix, args);
}
pub inline fn __MATHDECL_ALIAS(@"type": anytype, function: anytype, suffix: anytype, args: anytype, alias: anytype) @TypeOf(__MATHDECL_1(@"type", function, suffix, args)) {
    _ = @TypeOf(alias);
    return __MATHDECL_1(@"type", function, suffix, args);
}
pub const _Mdouble_ = f64;
pub inline fn __MATH_PRECNAME(name: anytype, r: anytype) @TypeOf(__CONCAT(name, r)) {
    return __CONCAT(name, r);
}
pub const __MATH_DECLARING_DOUBLE = @as(c_int, 1);
pub const __MATH_DECLARING_FLOATN = @as(c_int, 0);
pub const __MATH_DECLARE_LDOUBLE = @as(c_int, 1);
pub inline fn __MATHCALL_NARROW(func: anytype, redir: anytype, nargs: anytype) @TypeOf(__MATHCALL_NARROW_NORMAL(func, nargs)) {
    _ = @TypeOf(redir);
    return __MATHCALL_NARROW_NORMAL(func, nargs);
}
pub inline fn signbit(x: anytype) @TypeOf(__builtin_signbit(x)) {
    return __builtin_signbit(x);
}
pub const MATH_ERRNO = @as(c_int, 1);
pub const MATH_ERREXCEPT = @as(c_int, 2);
pub const math_errhandling = MATH_ERRNO | MATH_ERREXCEPT;
pub const M_E = @as(f64, 2.7182818284590452354);
pub const M_LOG2E = @as(f64, 1.4426950408889634074);
pub const M_LOG10E = @as(f64, 0.43429448190325182765);
pub const M_LN2 = @as(f64, 0.69314718055994530942);
pub const M_LN10 = @as(f64, 2.30258509299404568402);
pub const M_PI = @as(f64, 3.14159265358979323846);
pub const M_PI_2 = @as(f64, 1.57079632679489661923);
pub const M_PI_4 = @as(f64, 0.78539816339744830962);
pub const M_1_PI = @as(f64, 0.31830988618379067154);
pub const M_2_PI = @as(f64, 0.63661977236758134308);
pub const M_2_SQRTPI = @as(f64, 1.12837916709551257390);
pub const M_SQRT2 = @as(f64, 1.41421356237309504880);
pub const M_SQRT1_2 = @as(f64, 0.70710678118654752440);
pub inline fn STBIW_MALLOC(sz: anytype) @TypeOf(malloc(sz)) {
    return malloc(sz);
}
pub inline fn STBIW_REALLOC(p: anytype, newsz: anytype) @TypeOf(realloc(p, newsz)) {
    return realloc(p, newsz);
}
pub inline fn STBIW_FREE(p: anytype) @TypeOf(free(p)) {
    return free(p);
}
pub inline fn STBIW_REALLOC_SIZED(p: anytype, oldsz: anytype, newsz: anytype) @TypeOf(STBIW_REALLOC(p, newsz)) {
    _ = @TypeOf(oldsz);
    return STBIW_REALLOC(p, newsz);
}
pub inline fn STBIW_MEMMOVE(a: anytype, b: anytype, sz: anytype) @TypeOf(memmove(a, b, sz)) {
    return memmove(a, b, sz);
}
pub const _ASSERT_H = @as(c_int, 1);
pub inline fn assert(expr: anytype) @TypeOf(__ASSERT_VOID_CAST(@as(c_int, 0))) {
    _ = @TypeOf(expr);
    return __ASSERT_VOID_CAST(@as(c_int, 0));
}
pub inline fn STBIW_ASSERT(x: anytype) @TypeOf(assert(x)) {
    return assert(x);
}
pub inline fn STBIW_UCHAR(x: anytype) u8 {
    return @import("std").zig.c_translation.cast(u8, x & @as(c_int, 0xff));
}
pub inline fn stbiw__max(a: anytype, b: anytype) @TypeOf(if (a > b) a else b) {
    return if (a > b) a else b;
}
pub inline fn stbiw__sbraw(a: anytype) @TypeOf(@import("std").zig.c_translation.cast([*c]c_int, @import("std").zig.c_translation.cast(?*anyopaque, a)) - @as(c_int, 2)) {
    return @import("std").zig.c_translation.cast([*c]c_int, @import("std").zig.c_translation.cast(?*anyopaque, a)) - @as(c_int, 2);
}
pub inline fn stbiw__sbm(a: anytype) @TypeOf(stbiw__sbraw(a)[@as(usize, @intCast(@as(c_int, 0)))]) {
    return stbiw__sbraw(a)[@as(usize, @intCast(@as(c_int, 0)))];
}
pub inline fn stbiw__sbn(a: anytype) @TypeOf(stbiw__sbraw(a)[@as(usize, @intCast(@as(c_int, 1)))]) {
    return stbiw__sbraw(a)[@as(usize, @intCast(@as(c_int, 1)))];
}
pub inline fn stbiw__sbneedgrow(a: anytype, n: anytype) @TypeOf((a == @as(c_int, 0)) or ((stbiw__sbn(a) + n) >= stbiw__sbm(a))) {
    return (a == @as(c_int, 0)) or ((stbiw__sbn(a) + n) >= stbiw__sbm(a));
}
pub inline fn stbiw__sbmaybegrow(a: anytype, n: anytype) @TypeOf(if (stbiw__sbneedgrow(a, n)) stbiw__sbgrow(a, n) else @as(c_int, 0)) {
    return if (stbiw__sbneedgrow(a, n)) stbiw__sbgrow(a, n) else @as(c_int, 0);
}
pub inline fn stbiw__sbcount(a: anytype) @TypeOf(if (a) stbiw__sbn(a) else @as(c_int, 0)) {
    return if (a) stbiw__sbn(a) else @as(c_int, 0);
}
pub inline fn stbiw__zlib_huffa(b: anytype, c: anytype) @TypeOf(stbiw__zlib_add(stbiw__zlib_bitrev(b, c), c)) {
    return stbiw__zlib_add(stbiw__zlib_bitrev(b, c), c);
}
pub inline fn stbiw__zlib_huff1(n: anytype) @TypeOf(stbiw__zlib_huffa(@as(c_int, 0x30) + n, @as(c_int, 8))) {
    return stbiw__zlib_huffa(@as(c_int, 0x30) + n, @as(c_int, 8));
}
pub inline fn stbiw__zlib_huff2(n: anytype) @TypeOf(stbiw__zlib_huffa((@as(c_int, 0x190) + n) - @as(c_int, 144), @as(c_int, 9))) {
    return stbiw__zlib_huffa((@as(c_int, 0x190) + n) - @as(c_int, 144), @as(c_int, 9));
}
pub inline fn stbiw__zlib_huff3(n: anytype) @TypeOf(stbiw__zlib_huffa((@as(c_int, 0) + n) - @as(c_int, 256), @as(c_int, 7))) {
    return stbiw__zlib_huffa((@as(c_int, 0) + n) - @as(c_int, 256), @as(c_int, 7));
}
pub inline fn stbiw__zlib_huff4(n: anytype) @TypeOf(stbiw__zlib_huffa((@as(c_int, 0xc0) + n) - @as(c_int, 280), @as(c_int, 8))) {
    return stbiw__zlib_huffa((@as(c_int, 0xc0) + n) - @as(c_int, 280), @as(c_int, 8));
}
pub inline fn stbiw__zlib_huff(n: anytype) @TypeOf(if (n <= @as(c_int, 143)) stbiw__zlib_huff1(n) else if (n <= @as(c_int, 255)) stbiw__zlib_huff2(n) else if (n <= @as(c_int, 279)) stbiw__zlib_huff3(n) else stbiw__zlib_huff4(n)) {
    return if (n <= @as(c_int, 143)) stbiw__zlib_huff1(n) else if (n <= @as(c_int, 255)) stbiw__zlib_huff2(n) else if (n <= @as(c_int, 279)) stbiw__zlib_huff3(n) else stbiw__zlib_huff4(n);
}
pub inline fn stbiw__zlib_huffb(n: anytype) @TypeOf(if (n <= @as(c_int, 143)) stbiw__zlib_huff1(n) else stbiw__zlib_huff2(n)) {
    return if (n <= @as(c_int, 143)) stbiw__zlib_huff1(n) else stbiw__zlib_huff2(n);
}
pub const stbiw__ZHASH = @as(c_int, 16384);
pub inline fn stbiw__wptag(data: anytype, s: anytype) @TypeOf(stbiw__wpng4(data, s[@as(usize, @intCast(@as(c_int, 0)))], s[@as(usize, @intCast(@as(c_int, 1)))], s[@as(usize, @intCast(@as(c_int, 2)))], s[@as(usize, @intCast(@as(c_int, 3)))])) {
    return stbiw__wpng4(data, s[@as(usize, @intCast(@as(c_int, 0)))], s[@as(usize, @intCast(@as(c_int, 1)))], s[@as(usize, @intCast(@as(c_int, 2)))], s[@as(usize, @intCast(@as(c_int, 3)))]);
}
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
pub const _IO_marker = struct__IO_marker;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_FILE = struct__IO_FILE;
pub const __va_list_tag = struct___va_list_tag;
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const __locale_data = struct___locale_data;
pub const __locale_struct = struct___locale_struct;
