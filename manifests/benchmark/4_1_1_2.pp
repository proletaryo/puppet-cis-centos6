# 4.1.1.2    Ensure system is disabled when audit logs are full (Scored)
class ciscentos6::benchmark::4_1_1_2 {

  if ! defined(Ciscentos6::Common::Add_file_line['space_left_action = email']) {
    ciscentos6::common::add_file_line { 'space_left_action = email':
      filepath => '/etc/audit/auditd.conf',
      addline => 'space_left_action = email',
      regex => '^space_left_action',
    } ->
    ciscentos6::common::add_file_line { 'action_mail_acct = root':
      filepath => '/etc/audit/auditd.conf',
      addline => 'action_mail_acct = root',
      regex => '^action_mail_acct',
    } ->
    ciscentos6::common::add_file_line { 'admin_space_left_action = halt':
      filepath => '/etc/audit/auditd.conf',
      addline => 'admin_space_left_action = halt',
      regex => '^admin_space_left_action',
    } ->
    notify{ "CIS Benchmark 4.1.1.2 : remediated":
      loglevel => notice,
    }
  }
  else {
    ciscentos6::common::just_relay_fact_value { '4.1.1.2':
      benchmark_number => '4.1.1.2',
      benchmark_status => $cis_benchmark_4_1_1_2,
    }
  }
}
