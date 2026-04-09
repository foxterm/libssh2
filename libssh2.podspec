Pod::Spec.new do |s|
  s.name             = 'libssh2'
  s.version          = '1.11.1'
  s.summary          = 'SSH,libssh2'
  s.description      = "libssh2 + OpenSSL"
  s.homepage         = 'https://github.com/foxterm/libssh2'
  s.license          = 'MIT'
  s.author           = { 'foxterm' => 'admin@foxterm.app' }
  s.source           = { :git => 'https://github.com/libssh2/libssh2.git', :tag => "libssh2-#{s.version}" }
  s.ios.deployment_target = "12.0"
  s.osx.deployment_target = "10.15"
  s.tvos.deployment_target = "12.0"
  s.visionos.deployment_target = "1.0"
  s.watchos.deployment_target = "8.0"
  s.source_files = 'libssh2/src/*.{c,h}', 'libssh2/include/*.h'
  s.public_header_files = 'libssh2/include/*.h'
  s.dependency 'OpenSSL-Universal'
  s.compiler_flags = '-DHAVE_LIBSSL=1 -DLIBSSH2_OPENSSL=1 -DHAVE_LIBZ=1 -DLIBSSH2_HAVE_ZLIB=1 -DSTDC_HEADERS=1 -DHAVE_STDLIB_H=1 -DHAVE_STDIO_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_UNISTD_H=1 -DHAVE_ALLOCA=1 -DHAVE_ALLOCA_H=1 -DHAVE_ARPA_INET_H=1 -DHAVE_NETINET_IN_H=1 -DHAVE_SYS_SOCKET_H=1 -DHAVE_SYS_UN_H=1 -DHAVE_SYS_IOCTL_H=1 -DHAVE_SYS_PARAM_H=1 -DHAVE_SYS_SELECT_H=1 -DHAVE_SYS_TIME_H=1 -DHAVE_SYS_UIO_H=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_SELECT=1 -DHAVE_SNPRINTF=1 -DHAVE_STRTOLL=1 -DHAVE_O_NONBLOCK=1 -DHAVE_FIONBIO=1'
  s.pod_target_xcconfig = {
     'GCC_PREPROCESSOR_DEFINITIONS[config=Debug]' => 'LIBSSH2DEBUG=1'
   }
  s.libraries = 'z'
end
