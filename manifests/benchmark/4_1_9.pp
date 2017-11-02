# 4.1.9    Ensure session initiation information is collected (Scored)
  if ! defined(Exec['line1']) {
    if defined('$cis_benchmark_4_1_9') {
      if $cis_benchmark_4_1_9 == 'failed' {   # remediate
        $line1 = '-w /var/run/utmp -p wa -k session'
        $line2 = '-w /var/log/wtmp -p wa -k session'
        $line3 = '-w /var/log/btmp -p wa -k session'
        exec {'line1':
          command => "echo $line1 >> /etc/audit/audit.rules",
          path    => "/bin:/sbin",
          unless  => "grep -P $line1 /etc/audit/audit.rules",
        }
        exec {'line2':
          command => "echo $line2 >> /etc/audit/audit.rules",
          path    => "/bin:/sbin",
          unless  => "grep -P $line2 /etc/audit/audit.rules",
          require => Exec['line1'],
        }
        exec {'line3':
          command => "echo $line3 >> /etc/audit/audit.rules",
          path    => "/bin:/sbin",
          unless  => "grep -P $line3 /etc/audit/audit.rules",
          require => Exec['line2'],
        }
      }
      else {
        notice( "CIS Benchmark 4.1.9 : $cis_benchmark_4_1_9")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.9':
      benchmark_number => '4.1.9',
      benchmark_status => $cis_benchmark_4_1_9,
    }
  }
}
