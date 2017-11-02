# 3.1.1    Ensure IP forwarding is disabled (Scored)
class ciscentos6::benchmark::3_1_1 {
  if $benchmark_status == 'failed' {   # remediate
    $addline = 'net.ipv4.ip_forward = 0'
    $regex = '^net.ipv4.ip_forward'
    exec{'/etc/sysctl.conf':
      command => "echo $addline >> /etc/sysctl.conf",
      path    => "/bin:/sbin",
      unless  => "grep -P $regex /etc/sysctl.conf",
      require => Exec['etc/sysctl.conf'],
    }
    exec {'etc/sysctl.conf':
      command => "sed -i '/$regex/c\\$addline' /etc/sysctl.conf",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/sysctl.conf",
    }
    exec {'set the active kernel parameters':
      command => "sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $regex /etc/sysctl.conf",
    }
    notify{ "CIS Benchmark 3.1.1 : remediated":
      require  => Exec['set the active kernel parameters'],
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 3.1.1 : $cis_benchmark_3_1_1")
  }
}
