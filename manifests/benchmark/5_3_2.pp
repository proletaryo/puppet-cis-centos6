# 5.3.2    Ensure lockout for failed password attempts is configured (Scored)
class ciscentos6::benchmark::5_3_2 {
  if defined('$cis_benchmark_5_3_2') {
    if $cis_benchmark_5_3_2 == 'failed' {   # remediate
      $addline = 'auth required pam_faillock.so preauth audit silent deny=5 unlock_time=900\nauth [success=1 default=bad] pam_unix.so\nauth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900\nauth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900'
      $regex = '^auth.+pam_unix.so'
      exec {'etc/pam.d/system-auth':
        command => "sed -i '/$regex/c\\$addline' /etc/pam.d/system-auth",
        path    => "/bin",
        onlyif  => "grep -P $regex /etc/pam.d/system-auth",
      } ->
      exec {'/etc/pam.d/system-auth':
        command => "echo $addline >> /etc/pam.d/system-auth",
        path    => "/bin:/sbin",
        unless  => "grep -P $regex /etc/pam.d/system-auth",
      } ->
      exec {'etc/pam.d/password-auth':
        command => "sed -i '/$regex/c\\$addline' /etc/pam.d/password-auth",
        path    => "/bin:/sbin",
        onlyif  => "grep -P $regex /etc/pam.d/password-auth",
      } ->
      exec {'/etc/pam.d/password-auth':
        command => "echo $addline >> /etc/pam.d/password-auth",
        path    => "/bin:/sbin",
        unless  => "grep -P $regex /etc/pam.d/password-auth",
      } ->
      notify{ "CIS Benchmark 5.3.2 : remediated":
        loglevel => notice,
      }
    }
    else {
      notice( "CIS Benchmark 5.3.2 : $cis_benchmark_5_3_2")
    }
  }
  else {
    fail('Error: Externals facts were not defined. Make sure facter version is 1.7+ and externals facts are in /etc/facter/facts.d/)')
  }
}
