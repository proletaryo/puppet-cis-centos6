# 4.1.3    Ensure auditing for processes that start prior to auditd is enabled (Scored)
class ciscentos6::benchmark::4_1_3 {
  if $cis_benchmark_4_1_3 == 'failed' {   # remediate
    exec {'/boot/grub/grub.conf':
      command => "sed -i '/^kernel/ s/$/ audit\\=1/' /boot/grub/grub.conf",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 4.1.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.3 : $cis_benchmark_4_1_3")
  }
}
