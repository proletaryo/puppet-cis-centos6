# NOTE: common resource for these benchmarks
# 5.1.2		Ensure permissions on /etc/crontab are configured (Scored)
# 5.1.3		Ensure permissions on /etc/cron.hourly are configured (Scored)
# 5.1.4		Ensure permissions on /etc/cron.daily are configured (Scored)
# 5.1.5		Ensure permissions on /etc/cron.weekly are configured (Scored)
# 5.1.6		Ensure permissions on /etc/cron.monthly are configured (Scored)
# 5.1.7		Ensure permissions on /etc/cron.d are configured (Scored)
# 5.1.8		Ensure at/cron is restricted to authorized users (Scored)
# 5.2.1    Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
define ciscentos6::common::set_file_permissions ( $benchmark_number, $benchmark_status, $permissions) {
  if defined('$benchmark_status') {
    if $benchmark_status == 'failed' {   # remediate
      file { $name:
      	owner => 'root',
		group => 'root',
        mode => $permissions,
      }

      notify{ "CIS Benchmark $benchmark_number : remediated":
        require  => File[$name],
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

