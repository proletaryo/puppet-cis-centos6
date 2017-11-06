# 4.1.5    Ensure events that modify user/group information are collected (Scored)
class ciscentos6::benchmark::4_1_5 {
  if $cis_benchmark_4_1_5 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $line = [
      '-w /etc/group -p wa -k identity',
      '-w /etc/passwd -p wa -k identity',
      '-w /etc/gshadow -p wa -k identity',
      '-w /etc/shadow -p wa -k identity',
      '-w /etc/security/opasswd -p wa -k identity'
    ]
    $lineregex = [
      '^-w\\s+/etc/group\\s+-p\\s+wa\\s+-k\\s+identity',
      '^-w\\s+/etc/passwd\\s+-p\\s+wa\\s+-k\\s+identity',
      '^-w\\s+/etc/gshadow\\s+-p\\s+wa\\s+-k\\s+identity',
      '^-w\\s+/etc/shadow\\s+-p\\s+wa\\s+-k\\s+identity',
      '^-w\\s+/etc/security/opasswd\\s+-p\\s+wa\\s+-k\\s+identity'
    ]
    define 4_1_5 {
      exec {"4_1_5 $title":
        command => "echo ${line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${lineregex[$title]} $filepath",
      }
    }
    4_1_5 { [0, 1, 2, 3, 4]: } ->
    notify{ "CIS Benchmark 4.1.5 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.5 : $cis_benchmark_4_1_5")
  }
}
