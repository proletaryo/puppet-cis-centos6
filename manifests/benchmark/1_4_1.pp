# 1.4.1    Ensure permissions on bootloader config are configured (Scored)
class ciscentos6::benchmark::1_4_1 {

  if ! defined(Ciscentos6::Common::Set_file_permissions['/boot/grub/grub.conf']) {
    ciscentos6::common::set_file_permissions { '/boot/grub/grub.conf':
      benchmark_number => '1.4.1',
      benchmark_status => $cis_benchmark_1_4_1,
      permissions    => 'og-rwx',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '1.4.1':
      benchmark_number => '1.4.1',
      benchmark_status => $cis_benchmark_1_4_1,
    }
  }
}
