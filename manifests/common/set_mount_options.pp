# NOTE: common resource for these benchmarks
# 1.1.3    Ensure nodev option set on /tmp partition (Scored)
# 1.1.4    Ensure nosuid option set on /tmp partition (Scored)
# 1.1.5    Ensure noexec option set on /tmp partition (Scored)
# 1.1.8    Ensure nodev option set on /var/tmp partition (Scored)
# 1.1.9    Ensure nosuid option set on /var/tmp partition (Scored)
# 1.1.10    Ensure noexec option set on /var/tmp partition (Scored)
# 1.1.14    Ensure nodev option set on /home partition (Scored)
# 1.1.15    Ensure nodev option set on /dev/shm partition (Scored)
# 1.1.16    Ensure nosuid option set on /dev/shm partition (Scored)
# 1.1.17    Ensure noexec option set on /dev/shm partition (Scored)
define ciscentos6::common::set_mount_options (
  $benchmark_number, $benchmark_status, $mount_options
) {
  if defined('$benchmark_status') {
    if $benchmark_status == 'failed' {   # remediate
      mount { $name:
        options => $mount_options,
      }

      notify{ "CIS Benchmark $benchmark_number : remediated":
        require  => Mount[$name],
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
