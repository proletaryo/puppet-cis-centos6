# 5.3.4    Ensure password hashing algorithm is SHA-512 (Scored)
  if ! defined(Exec['/etc/pam.d/password-auth']) {
    if defined('$cis_benchmark_5_3_4') {
      if $cis_benchmark_5_3_4 == 'failed' {   # remediate
        $addline = 'password sufficient pam_unix.so sha512'
        $regex = '^password.+sufficient.+pam_unix.so'
        exec {'/etc/pam.d/password-auth':
          command => "echo $addline >> /etc/pam.d/password-auth",
          path    => "/bin:/sbin",
          unless  => "grep -P $regex /etc/pam.d/password-auth",
          require => Exec['etc/pam.d/password-auth'],
        }
        exec {'/etc/pam.d/system-auth':
          command => "echo $addline >> /etc/pam.d/system-auth",
          path    => "/bin:/sbin",
          unless  => "grep -P $regex /etc/pam.d/system-auth",
          require => Exec['etc/pam.d/system-auth'],
        }
        exec {'etc/pam.d/password-auth':
          command => "sed -i 's/^password.\+sufficient.\+pam_unix.so/password sufficient pam_unix.so sha512/' /etc/pam.d/password-auth",
          path    => "/bin:/sbin",
          onlyif  => "grep -P $regex /etc/pam.d/password-auth",
        }
        exec {'etc/pam.d/system-auth':
          command => "sed -i 's/^password.\+sufficient.\+pam_unix.so/password sufficient pam_unix.so sha512/' /etc/pam.d/system-auth",
          path    => "/bin:/sbin",
          onlyif  => "grep -P $regex /etc/pam.d/system-auth",
        }
      }
      else {
        notice( "CIS Benchmark 5.3.4 : $cis_benchmark_5_3_4")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.3.4':
      benchmark_number => '5.3.4',
      benchmark_status => $cis_benchmark_5_3_4,
    }
  }
}
