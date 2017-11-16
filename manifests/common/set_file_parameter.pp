# NOTE: common resource for these benchmarks
# 4.2.1.3    Ensure rsyslog default file permissions configured (Scored)
# 5.2.2     Ensure SSH Protocol is set to 2 (Scored)
# 5.2.3     Ensure SSH LogLevel is set to INFO (Scored)
# 5.2.4    Ensure SSH X11 forwarding is disabled (Scored)
# 5.2.5    Ensure SSH MaxAuthTries is set to 4 or less (Scored)
# 5.2.6    Ensure SSH IgnoreRhosts is enabled (Scored)
# 5.2.7    Ensure SSH HostbasedAuthentication is disabled (Scored)
# 5.2.8    Ensure SSH root login is disabled (Scored)
# 5.2.9    Ensure SSH PermitEmptyPasswords is disabled (Scored)
# 5.2.10    Ensure SSH PermitUserEnvironment is disabled (Scored)
# 5.2.11    Ensure only approved ciphers are used (Scored)
# 5.2.12    Ensure only approved MAC algorithms are used (Scored)
# 5.2.14    Ensure SSH LoginGraceTime is set to one minute or less (Scored)
# 5.2.15    Ensure SSH access is limited (Scored)
# 5.2.16    Ensure SSH warning banner is configured (Scored)
# 5.4.1.1   Ensure password expiration is 90 days or less (Scored)
# 5.4.1.2    Ensure minimum days between password changes is 7 or more (Scored)
# 5.4.1.3    Ensure password expiration warning days is 7 or more (Scored)
define ciscentos6::common::set_file_parameter (
  $benchmark_number, $benchmark_status, $filepath, $parameter
) {
  if defined('$benchmark_status') {
    if $benchmark_status == 'failed' {   # remediate
      augeas { $name:
        context => $filepath,
        changes => $parameter,
      } ->
      notify{ "CIS Benchmark $benchmark_number : remediated":
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
