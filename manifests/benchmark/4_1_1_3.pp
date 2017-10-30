# 4.1.1.3    Ensure audit logs are not automatically deleted (Scored)
class ciscentos6::benchmark::4_1_1_3 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/etc/audit/auditd.conf']) {
    ciscentos6::common::set_file_parameter { '/etc/audit/auditd.conf':
      benchmark_number => '4.1.1.3',
      benchmark_status => $cis_benchmark_4_1_1_3,
      filepath => '/files/etc/audit/auditd.conf',
      parameter => 'set max_log_file_action = keep_logs',
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.1.3':
      benchmark_number => '4.1.1.3',
      benchmark_status => $cis_benchmark_4_1_1_3,
    }
  }
}
