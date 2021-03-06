# 5.3.1    Ensure password creation requirements are configured (Scored)
class ciscentos6::benchmark::5_3_1 {
  if $cis_benchmark_5_3_1 == 'failed' {   # remediate
    $addline = 'password requisite pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1'
    $regex = '^password.+pam_cracklib.so'
    exec {'5_3_1 /etc/pam.d/password-auth':
      command => "echo $addline >> /etc/pam.d/password-auth",
      path    => "/bin:/sbin",
      unless  => "grep -P $regex /etc/pam.d/password-auth",
    } ->
    exec {'5_3_1 etc/pam.d/password-auth':
      command => "sed -i '/$regex/c\\$addline' /etc/pam.d/password-auth",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/pam.d/password-auth",
    } ->
    exec {'5_3_1 /etc/pam.d/system-auth':
      command => "echo $addline >> /etc/pam.d/system-auth",
      path    => "/bin:/sbin",
      unless  => "grep -P $regex /etc/pam.d/system-auth",
    } ->
    exec {'5_3_1 etc/pam.d/system-auth':
      command => "sed -i '/$regex/c\\$addline' /etc/pam.d/system-auth",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/pam.d/system-auth",
    } ->
    notify{ "CIS Benchmark 5.3.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 5.3.1 : $cis_benchmark_5_3_1")
  }
}
