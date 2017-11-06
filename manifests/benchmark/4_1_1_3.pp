# 4.1.1.3    Ensure audit logs are not automatically deleted (Scored)
class ciscentos6::benchmark::4_1_1_3 {

  if ! defined(Ciscentos6::Common::Add_file_line['max_log_file_action = keep_logs']) {
    ciscentos6::common::add_file_line { 'max_log_file_action = keep_logs':
      filepath => '/etc/audit/auditd.conf',
      addline => 'max_log_file_action = keep_logs',
      regex => '^max_log_file_action',
    } ->
    notify{ "CIS Benchmark 4.1.1.3 : remediated":
      loglevel => notice,
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.1.3':
      benchmark_number => '4.1.1.3',
      benchmark_status => $cis_benchmark_4_1_1_3,
    }
  }
}
