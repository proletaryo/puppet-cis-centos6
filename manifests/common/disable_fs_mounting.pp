# NOTE: common resource for these benchmarks
# 1.1.1.1    Ensure mounting of cramfs filesystems is disabled (Scored)
# 1.1.1.2    Ensure mounting of freevxfs filesystems is disabled (Scored)
# 1.1.1.3    Ensure mounting of jffs2 filesystems is disabled (Scored)
# 1.1.1.4    Ensure mounting of hfs filesystems is disabled (Scored)
# 1.1.1.5    Ensure mounting of hfsplus filesystems is disabled (Scored)
# 1.1.1.6    Ensure mounting of squashfs filesystems is disabled (Scored)
# 1.1.1.7    Ensure mounting of udf filesystems is disabled (Scored)
# 1.1.1.8    Ensure mounting of FAT filesystems is disabled (Scored)
define ciscentos6::common::disable_fs_mounting ( $benchmark_number, $benchmark_status) {
  if defined('$benchmark_status') {
    if $benchmark_status == 'failed' {   # remediate
      if ! defined(File['/etc/modprobe.d/CIS.conf']) {
        file { '/etc/modprobe.d/CIS.conf':
          ensure => 'file',
          owner  => 'root',
          group  => 'root',
          mode   => '0600',
          source => 'puppet:///modules/ciscentos6/os/etc/modprobe.d/CIS.conf',
        }
      }
      notify{ "CIS Benchmark $benchmark_number : remediated":
        require  => File['/etc/modprobe.d/CIS.conf'],
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark $benchmark_number : $benchmark_status")
    }
  }
  else {
    fail("Error: Externals facts were not defined. Make sure facter version is 1.7+ and \
externals facts are in /etc/facter/facts.d/)")
  }
}
