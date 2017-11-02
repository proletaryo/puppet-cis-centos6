# NOTE: common resource for these benchmarks
# 4.1.1.2   Ensure system is disabled when audit logs are full (Scored)
# 4.1.1.3   Ensure audit logs are not automatically deleted (Scored)
# 4.2.1.3    Ensure rsyslog default file permissions configured (Scored)
# 5.2.2     Ensure SSH Protocol is set to 2 (Scored)
# 5.2.3     Ensure SSH LogLevel is set to INFO (Scored)
# 5.4.1.1   Ensure password expiration is 90 days or less (Scored)
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
