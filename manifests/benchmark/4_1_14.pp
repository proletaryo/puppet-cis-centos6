# 4.1.14    Ensure file deletion events by users are collected (Scored)
class ciscentos6::benchmark::4_1_14 {
  if $cis_benchmark_4_1_14 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $32line = [
      '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete'
    ]
    $32lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*unlink\\s*-S\\s*unlinkat\\s*-S\\s*rename\\s*-S\\s*renameat\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*delete'
    ]
    $64line = [
      '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete',
      '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete'
    ]
    $64lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*unlink\\s*-S\\s*unlinkat\\s*-S\\s*rename\\s*-S\\s*renameat\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*delete',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*unlink\\s*-S\\s*unlinkat\\s*-S\\s*rename\\s*-S\\s*renameat\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*delete'
    ]
    define 4_1_14_32 {
      exec {"4_1_14_32 $title":
        command => "echo ${32line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${32lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 32",
      }
    }
    define 4_1_14_64 {
      exec {"4_1_14_64 $title":
        command => "echo ${64line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${64lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 64",
      }
    }
    4_1_14_32 { [0]: } ->
    4_1_14_64 { [0, 1]: } ->
    notify{ "CIS Benchmark 4.1.14 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.14 : $cis_benchmark_4_1_14")
  }
}
