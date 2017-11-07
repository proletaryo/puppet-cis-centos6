# 4.1.11    Ensure unsuccessful unauthorized file access attempts are collected (Scored)
class ciscentos6::benchmark::4_1_11 {
  if $cis_benchmark_4_1_11 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $32line = [
      '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access',
      '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access'
    ]
    $32lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*creat\\s*-S\\s*open\\s*-S\\s*openat\\s*-S\\s*truncate\\s*-S\\s*ftruncate\\s*-F\\s*exit=-EACCES\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*access',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*creat\\s*-S\\s*open\\s*-S\\s*openat\\s*-S\\s*truncate\\s*-S\\s*ftruncate\\s*-F\\s*exit=-EPERM\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*access'
    ]
    $64line = [
      '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access',
      '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access',
      '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access',
      '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access'
    ]
    $64lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*creat\\s*-S\\s*open\\s*-S\\s*openat\\s*-S\\s*truncate\\s*-S\\s*ftruncate\\s*-F\\s*exit=-EACCES\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*access',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*creat\\s*-S\\s*open\\s*-S\\s*openat\\s*-S\\s*truncate\\s*-S\\s*ftruncate\\s*-F\\s*exit=-EACCES\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*access',
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*creat\\s*-S\\s*open\\s*-S\\s*openat\\s*-S\\s*truncate\\s*-S\\s*ftruncate\\s*-F\\s*exit=-EPERM\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*access',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*creat\\s*-S\\s*open\\s*-S\\s*openat\\s*-S\\s*truncate\\s*-S\\s*ftruncate\\s*-F\\s*exit=-EPERM\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*access'
    ]
    define 4_1_11_32 {
      exec {"4_1_11_32 $title":
        command => "echo ${32line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${32lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 32",
      }
    }
    define 4_1_11_64 {
      exec {"4_1_11_64 $title":
        command => "echo ${64line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${64lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 64",
      }
    }
    4_1_11_32 { [0, 1]: } ->
    4_1_11_64 { [0, 1, 2, 3]: } ->
    notify{ "CIS Benchmark 4.1.11 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.11 : $cis_benchmark_4_1_11")
  }
}
