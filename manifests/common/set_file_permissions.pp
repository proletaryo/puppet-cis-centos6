# NOTE: common resource for these benchmarks
# 1.4.1    Ensure permissions on bootloader config are configured (Scored)
# 1.7.1.5    Ensure permissions on /etc/issue are configured (Scored)
# 3.4.4    Ensure permissions on /etc/hosts.allow are configured (Scored)
# 3.4.5    Ensure permissions on /etc/hosts.deny are configured (Scored)
# 5.1.2		Ensure permissions on /etc/crontab are configured (Scored)
# 5.1.3		Ensure permissions on /etc/cron.hourly are configured (Scored)
# 5.1.4		Ensure permissions on /etc/cron.daily are configured (Scored)
# 5.1.5		Ensure permissions on /etc/cron.weekly are configured (Scored)
# 5.1.6		Ensure permissions on /etc/cron.monthly are configured (Scored)
# 5.1.7		Ensure permissions on /etc/cron.d are configured (Scored)
# 5.1.8		Ensure at/cron is restricted to authorized users (Scored)
# 5.2.1    Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
# 6.1.2    Ensure permissions on /etc/passwd are configured (Scored)
# 6.1.3    Ensure permissions on /etc/shadow are configured (Scored)
# 6.1.4    Ensure permissions on /etc/group are configured (Scored)
# 6.1.5    Ensure permissions on /etc/gshadow are configured (Scored)
# 6.1.6    Ensure permissions on /etc/passwd- are configured (Scored)
# 6.1.7    Ensure permissions on /etc/shadow- are configured (Scored)
# 6.1.8    Ensure permissions on /etc/group- are configured (Scored)
# 6.1.9    Ensure permissions on /etc/gshadow- are configured (Scored)
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
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}

