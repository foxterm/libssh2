// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "libssh2",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(name: "CSSH2", targets: ["CSSH2"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/krzyzanowskim/OpenSSL.git",
            .upToNextMinor(from: "3.6.0001")
        )
    ],
    targets: [
        .target(
            name: "CSSH2",
            dependencies: [
                .product(name: "OpenSSL", package: "OpenSSL")
            ],
            path: "libssh2",
            exclude: [
                "src/CMakeLists.txt",
                "src/Makefile.in",
                "src/Makefile.am",
                "src/Makefile.inc",
                "src/libssh2.rc",
                "src/libssh2_config_cmake.h.in",
                "src/libssh2_config.h.in",
            ],
            sources: ["src"],
            publicHeadersPath: "include",
            cSettings: [
                .define("HAVE_LIBSSL"),
                .define("LIBSSH2_OPENSSL"),
                .define("HAVE_LIBZ"),
                .define("LIBSSH2_HAVE_ZLIB"),
                .define("STDC_HEADERS"),
                .define("HAVE_STDLIB_H"),
                .define("HAVE_STDIO_H"),
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_UNISTD_H"),
                .define("HAVE_ALLOCA"),
                .define("HAVE_ALLOCA_H"),
                .define("HAVE_ARPA_INET_H"),
                .define("HAVE_NETINET_IN_H"),
                .define("HAVE_SYS_SOCKET_H"),
                .define("HAVE_SYS_UN_H"),
                .define("HAVE_SYS_IOCTL_H"),
                .define("HAVE_SYS_PARAM_H"),
                .define("HAVE_SYS_SELECT_H"),
                .define("HAVE_SYS_TIME_H"),
                .define("HAVE_SYS_UIO_H"),
                .define("HAVE_GETTIMEOFDAY"),
                .define("HAVE_POLL"),
                .define("HAVE_SNPRINTF"),
                .define("HAVE_STRTOLL"),
                .define("HAVE_O_NONBLOCK"),
                .define("HAVE_FIONBIO"),
                .define("LIBSSH2DEBUG", to: "1", .when(configuration: .debug)),
            ],
            linkerSettings: [
                .linkedLibrary("z")
            ]
        )
    ]
)
