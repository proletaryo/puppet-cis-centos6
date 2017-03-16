# NOTE: for benchmarks that remdiation needs manual intervention (e.g. create new partition)
# 1.1.2    Ensure separate partition exists for /tmp (Scored)
define ciscentos6::common::just_relay_fact_value ( $benchmark_number, $benchmark_status) {
  if defined('$benchmark_status') {
    if $benchmark_status == 'failed' {   # raise an alert
      alert( "CIS Benchmark $benchmark_number : $benchmark_status")
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

