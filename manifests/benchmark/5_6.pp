# 5.6    Ensure access to the su command is restricted (Scored)
class ciscentos6::benchmark::5_6 {
  if defined('$cis_benchmark_5_6') {
    if $cis_benchmark_5_6 == 'failed' {   # remediate
      exec {'uncomment line in /etc/pam.d/su':
        command => "sed -i '/required.\+pam_wheel\.so use_uid/ s/#auth/auth/' /etc/pam.d/su",
        path    => "/bin:/sbin",
      } ->
      exec {'add line to /etc/pam.d/su':
        command => "echo 'auth required pam_wheel\.so use_uid' >> /etc/pam.d/su",
        path    => "/bin:/sbin",
        unless  => "grep -P '^auth.+required.+pam_wheel\.so .+se_uid' $filepath",
      } ->
      notify{ "CIS Benchmark 5.6 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 5.6  : $cis_benchmark_5_6")
    }
  }
  else {
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}
