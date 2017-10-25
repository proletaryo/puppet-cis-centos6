# NOTE: common resource for these benchmarks
# 5.2.2    Ensure SSH Protocol is set to 2 (Scored)
# 5.2.3    Ensure SSH LogLevel is set to INFO (Scored)
define ciscentos6::common::set_file_parameter (
  $benchmark_number, $benchmark_status, $filepath, $parameter
) {
  if defined('$benchmark_status') {
    if $benchmark_status == 'failed' {   # remediate
      augeas { $name:
        context => $filepath,
        changes => $parameter,
      }

      notify{ "CIS Benchmark $benchmark_number : remediated":
        require  => Augeas[$name],
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
