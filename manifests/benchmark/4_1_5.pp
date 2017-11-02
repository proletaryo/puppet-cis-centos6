# 4.1.5    Ensure events that modify user/group information are collected (Scored)
class ciscentos6::benchmark::4_1_5 {
  if defined('$cis_benchmark_4_1_5') {
    if $cis_benchmark_4_1_5 == 'failed' {   # remediate
      $line1 = '-w /etc/group -p wa -k identity'
      $line2 = '-w /etc/passwd -p wa -k identity'
      $line3 = '-w /etc/gshadow -p wa -k identity'
      $line4 = '-w /etc/shadow -p wa -k identity'
      $line5 = '-w /etc/security/opasswd -p wa -k identity'
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
      exec {'line4':
        command => "echo $line4 >> /etc/audit/audit.rules",
        path    => "/bin:/sbin",
        unless  => "grep -P $line4 /etc/audit/audit.rules",
        require => Exec['line3'],
      }
      exec {'line5':
        command => "echo $line5 >> /etc/audit/audit.rules",
        path    => "/bin:/sbin",
        unless  => "grep -P $line5 /etc/audit/audit.rules",
        require => Exec['line4'],
      }
      notify{ "CIS Benchmark 4.1.5 : remediated":
        require => Exec['line5'],
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 4.1.5 : $cis_benchmark_4_1_5")
    }
  }
  else {
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}
