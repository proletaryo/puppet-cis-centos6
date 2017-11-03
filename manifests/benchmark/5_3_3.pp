# 5.3.3    Ensure password reuse is limited (Scored)
class ciscentos6::benchmark::5_3_3 {
  if $cis_benchmark_5_3_3 == 'failed' {   # remediate
    $addline = 'password sufficient pam_unix.so remember=5'
    $regex = '^password.+sufficient.+pam_unix.so'
    exec {'etc/pam.d/system-auth':
      command => "sed -i 's/^password.\+sufficient.\+pam_unix.so/password sufficient pam_unix.so remember=5/' /etc/pam.d/system-auth",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/pam.d/system-auth",
    } ->
    exec {'/etc/pam.d/system-auth':
      command => "echo $addline >> /etc/pam.d/system-auth",
      path    => "/bin:/sbin",
      unless  => "grep -P $regex /etc/pam.d/system-auth",
    } ->
    exec {'etc/pam.d/password-auth':
      command => "sed -i 's/^password.\+sufficient.\+pam_unix.so/password sufficient pam_unix.so remember=5/' /etc/pam.d/password-auth",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/pam.d/password-auth",
    } ->
    exec {'/etc/pam.d/password-auth':
      command => "echo $addline >> /etc/pam.d/password-auth",
      path    => "/bin:/sbin",
      unless  => "grep -P $regex /etc/pam.d/password-auth",
    } ->
    notify{ "CIS Benchmark 5.3.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 5.3.3 : $cis_benchmark_5_3_3")
  }
}
