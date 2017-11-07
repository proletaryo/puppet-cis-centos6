# 4.1.10    Ensure discretionary access control permission modification events are collected (Scored)
class ciscentos6::benchmark::4_1_10 {
  if $cis_benchmark_4_1_10 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $32line = [
      '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod',
      '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod',
      '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod'
    ]
    $32lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*chmod\\s*-S\\s*fchmod\\s*-S\\s*fchmodat\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*chown\\s*-S\\s*fchown\\s*-S\\s*fchownat\\s*-S\\s*lchown\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*setxattr\\s*-S\\s*lsetxattr\\s*-S\\s*fsetxattr\\s*-S\\s*removexattr\\s*-S\\s*lremovexattr\\s*-S\\s*fremovexattr\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod'
    ]
    $64line = [
      '-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod',
      '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod',
      '-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod',
      '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod',
      '-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod',
      '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod'
    ]
    $64lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*chmod\\s*-S\\s*fchmod\\s*-S\\s*fchmodat\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*chmod\\s*-S\\s*fchmod\\s*-S\\s*fchmodat\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod',
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*chown\\s*-S\\s*fchown\\s*-S\\s*fchownat\\s*-S\\s*lchown\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*chown\\s*-S\\s*fchown\\s*-S\\s*fchownat\\s*-S\\s*lchown\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod',
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*setxattr\\s*-S\\s*lsetxattr\\s*-S\\s*fsetxattr\\s*-S\\s*removexattr\\s*-S\\s*lremovexattr\\s*-S\\s*fremovexattr\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*setxattr\\s*-S\\s*lsetxattr\\s*-S\\s*fsetxattr\\s*-S\\s*removexattr\\s*-S\\s*lremovexattr\\s*-S\\s*fremovexattr\\s*-F\\s*auid>=500\\s*-F\\s*auid!=4294967295\\s*-k\\s*perm_mod'      
    ]
    define 4_1_10_32 {
      exec {"4_1_10_32 $title":
        command => "echo ${32line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${32lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 32",
      }
    }
    define 4_1_10_64 {
      exec {"4_1_10_64 $title":
        command => "echo ${64line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${64lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 64",
      }
    }
    4_1_10_32 { [0, 1, 2]: } ->
    4_1_10_64 { [0, 1, 2, 3, 4, 5]: } ->
    notify{ "CIS Benchmark 4.1.10 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.10 : $cis_benchmark_4_1_10")
  }
}
