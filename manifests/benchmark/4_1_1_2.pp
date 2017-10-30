# 4.1.1.2    Ensure system is disabled when audit logs are full (Scored)
class ciscentos6::benchmark::4_1_1_2 {

  if ! defined(Ciscentos6::Common::Set_file_parameter['/etc/audit/auditd.conf']) {
    ciscentos6::common::set_file_parameter { '/etc/audit/auditd.conf':
      benchmark_number => '4.1.1.2',
      benchmark_status => $cis_benchmark_4_1_1_2,
      filepath => '/files/etc/audit/auditd.conf',
      parameter => [
        'set space_left_action = email',
        'set action_mail_acct = root',
        'set admin_space_left_action = halt',
      ]
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.1.2':
      benchmark_number => '4.1.1.2',
      benchmark_status => $cis_benchmark_4_1_1_2,
    }
  }
}
