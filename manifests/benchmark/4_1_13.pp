# 4.1.13    Ensure successful file system mounts are collected (Scored)
class ciscentos6::benchmark::4_1_13 {
  if $cis_benchmark_4_1_13 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $32line = [
      '-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts'
    ]
    $32lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*mount\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*mounts'
    ]
    $64line = [
      '-a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k mounts',
      '-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts'
    ]
    $64lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*mount\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*mounts',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*mount\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*mounts'
    ]
    define 4_1_13_32 {
      exec {"4_1_13_32 $title":
        command => "echo ${32line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${32lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 32",
      }
    }
    define 4_1_13_64 {
      exec {"4_1_13_64 $title":
        command => "echo ${64line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${64lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 64",
      }
    }
    4_1_13_32 { [0]: } ->
    4_1_13_64 { [0, 1]: } ->
    notify{ "CIS Benchmark 4.1.13 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.13 : $cis_benchmark_4_1_13")
  }
}
