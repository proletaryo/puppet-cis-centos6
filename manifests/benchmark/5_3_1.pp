# 5.3.1    Ensure password creation requirements are configured (Scored)
class ciscentos6::benchmark::5_3_1 {
  if ! defined(Exec['/etc/pam.d/password-auth']) {
    if defined('$cis_benchmark_5_3_1') {
      if $cis_benchmark_5_3_1 == 'failed' {   # remediate
        $addline = 'password requisite pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1'
        exec {'/etc/pam.d/password-auth':
          command => "echo $addline >> /etc/pam.d/password-auth",
          path    => "/bin",
          unless  => "grep pam_cracklib.so /etc/pam.d/password-auth",
        }
        exec {'/etc/pam.d/system-auth':
          command => "echo $addline >> /etc/pam.d/system-auth",
          path    => "/bin",
          unless  => "grep pam_cracklib.so /etc/pam.d/system-auth",
        }
        exec {'etc/pam.d/password-auth':
          command => "sed -i '/pam_cracklib.so/c\\$addline' /etc/pam.d/password-auth",
          path    => "/bin",
          onlyif  => "grep pam_cracklib.so /etc/pam.d/password-auth",
        }
        exec {'etc/pam.d/system-auth':
          command => "sed -i '/pam_cracklib.so/c\\$addline' /etc/pam.d/system-auth",
          path    => "/bin",
          onlyif  => "grep pam_cracklib.so /etc/pam.d/system-auth",
        }
      }
      else {
        notice( "CIS Benchmark 5.3.1 : $cis_benchmark_5_3_1")
      }
    }
    else {
      fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '5.3.1':
      benchmark_number => '5.3.1',
      benchmark_status => $cis_benchmark_5_3_1,
    }
  }
}
