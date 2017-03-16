# 1.1.1.1    Ensure mounting of cramfs filesystems is disabled (Scored)
class ciscentos6::benchmark::1_1_1_1 (
  $benchmark_number = '1.1.1.1',
  $benchmark_status = $cis_benchmark_1_1_1_1,
) {

  # file { '/etc/modprobe.d/CIS.conf':
  # }

  # # TODO: put the installation of external facts outside of remediation
  # if versioncmp($::facterversion, '1.7') > 0 {
  #   file { "/etc/facter/facts.d/benchmark-${benchmark_number}.sh":
  #     ensure => 'file',
  #     owner  => 'root',
  #     group  => 'root',
  #     mode   => '0700',
  #     source => "puppet:///modules/ciscentos6/scripts/benchmark-${benchmark_number}.sh",
  #   }

  #   $status = $benchmark_status ? {
  #     'pass'  => 'info',
  #     default => 'warning',
  #   }

  #   notify{ "CIS Benchmark $benchmark_number : ${benchmark_status}":
  #     require  => File["/etc/facter/facts.d/benchmark-${benchmark_number}.sh"],
  #     loglevel => $status,
  #   }
  # }
  # else {
  #   fail("Error: Can't use external facts in ${::fqdn}, facter must be upgraded (> 1.7)")
  # }

  # $status = $benchmark_status ? {
  #   'pass'  => 'info',
  #   default => 'warning',
  # }

  # notify{ 'test': 
  # # message => $facts['cis_benchmark_1_1_1_1'],
  #   message => $benchmark_status,
  # }

  if defined('$benchmark_status') {
    if $benchmark_status == 'fail' {   # remediate
      file { '/etc/modprobe.d/CIS.conf':
        ensure => 'file',
        owner  => 'root',
        group  => 'root',
        mode   => '0600',
        source => 'puppet:///modules/ciscentos6/os/etc/modprobe.d/CIS.conf',
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
