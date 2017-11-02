# 2.2.7    Ensure NFS and RPC are not enabled (Scored)
class ciscentos6::benchmark::2_2_7 {
  if $benchmark_status == 'failed' {   # remediate
    exec {'chkconfig nfs off':
      command => "chkconfig nfs off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P nfs | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    exec {'chkconfig rpcbind off':
      command => "chkconfig rpcbind off",
      onlyif => "chkconfig --list 2>/dev/null | grep -P rpcbind | grep -P '\\d:on'",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 2.2.7 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 2.2.7 : $cis_benchmark_2_2_7")
  }
}
