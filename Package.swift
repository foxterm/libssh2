// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "libssh2",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15),
        .tvOS(.v12),
        .watchOS(.v8),
        .custom("xros", versionString: "1.3"),
    ],
    products: [
        .library(name: "CSSH2", targets: ["CSSH2"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/krzyzanowskim/OpenSSL.git", .upToNextMajor(from: "3.6.0001"))
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
                .define("LIBSSH2_DSA_ENABLE"),  // 开启 ssh-dss
                .define("LIBSSH2_RSA"),  // 开启 RSA 主开关
                .define("LIBSSH2_RSA_SHA2"),  // 开启 rsa-sha2-256 / rsa-sha2-512
                .define("LIBSSH2_RSA_SHA1"),  // 开启 ssh-rsa (SHA-1)
                .define("LIBSSH2_ECDSA"),  // 开启 ecdsa 曲线
                .define("LIBSSH2_ED25519"),  // 开启 ed25519
                .define("OPENSSL_SUPPRESS_DEPRECATED"),  //OpenSSL 3.x 弃用警告抑制
                // 基础宏定义
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
