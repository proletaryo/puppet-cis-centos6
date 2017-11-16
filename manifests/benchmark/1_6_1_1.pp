# 1.6.1.1    Ensure SELinux is not disabled in bootloader configuration (Scored)
class ciscentos6::benchmark::1_6_1_1 {
  if $cis_benchmark_1_6_1_1 == 'failed' {   # remediate
    exec {'1_6_1_1 remove selinux=0':
      command => "sed -i '/^kernel/ s/ selinux\\=0//' /boot/grub/grub.conf",
      path    => "/bin:/sbin",
    } ->
    exec {'1_6_1_1 remove enforcing=0':
      command => "sed -i '/^kernel/ s/ enforcing\\=0//' /boot/grub/grub.conf",
      path    => "/bin:/sbin",
    } ->
    notify{ "CIS Benchmark 1.6.1.1 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 1.6.1.1 : $cis_benchmark_1_6_1_1")
  }
}
