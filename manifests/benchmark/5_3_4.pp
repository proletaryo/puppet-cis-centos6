# 5.3.4    Ensure password hashing algorithm is SHA-512 (Scored)
class ciscentos6::benchmark::5_3_4 {
  if $cis_benchmark_5_3_4 == 'failed' {   # remediate
    $addline = 'password sufficient pam_unix.so sha512'
    $regex = '^password.+sufficient.+pam_unix.so'
    exec {'5_3_4 etc/pam.d/system-auth':
      command => "sed -i 's/^password.\+sufficient.\+pam_unix.so/password sufficient pam_unix.so sha512/' /etc/pam.d/system-auth",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/pam.d/system-auth",
    } ->
    exec {'5_3_4 /etc/pam.d/system-auth':
      command => "echo $addline >> /etc/pam.d/system-auth",
      path    => "/bin:/sbin",
      unless  => "grep -P $regex /etc/pam.d/system-auth",
    } ->
    exec {'5_3_4 etc/pam.d/password-auth':
      command => "sed -i 's/^password.\+sufficient.\+pam_unix.so/password sufficient pam_unix.so sha512/' /etc/pam.d/password-auth",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/pam.d/password-auth",
    } ->
    exec {'5_3_4 /etc/pam.d/password-auth':
      command => "echo $addline >> /etc/pam.d/password-auth",
      path    => "/bin:/sbin",
      unless  => "grep -P $regex /etc/pam.d/password-auth",
    } ->
    notify{ "CIS Benchmark 5.3.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 5.3.4 : $cis_benchmark_5_3_4")
  }
}
