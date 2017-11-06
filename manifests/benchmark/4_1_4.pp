# 4.1.4    Ensure events that modify date and time information are collected (Scored)
class ciscentos6::benchmark::4_1_4 {
  if $cis_benchmark_4_1_4 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $32line = [
      '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change',
      '-a always,exit -F arch=b32 -S clock_settime -k time-change',
      '-w /etc/localtime -p wa -k time-change'
    ]
    $32lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*adjtimex\\s*-S\\s*settimeofday\\s*-S\\s*stime\\s*-k\\s*time-change',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*clock_settime\\s*-k\\s*time-change\\s*',
      '^-w\\s*/etc/localtime\\s*-p\\s*wa\\s*-k\\s*time-change'
    ]
    $64line = [
      '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change',
      '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change',
      '-a always,exit -F arch=b64 -S clock_settime -k time-change',
      '-a always,exit -F arch=b32 -S clock_settime -k time-change',
      '-w /etc/localtime -p wa -k time-change'
    ]
    $64lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*adjtimex\\s*-S\\s*settimeofday\\s*-k\\s*time-change',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*adjtimex\\s*-S\\s*settimeofday\\s*-S\\s*stime\\s*-k\\s*time-\\s*change',
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*clock_settime\\s*-k\\s*time-change',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*clock_settime\\s*-k\\s*time-change',
      '^-w\\s*/etc/localtime\\s*-p\\s*wa\\s*-k\\s*time-change'
    ]
    define 4_1_4_32 {
      exec {"4_1_4_32 $title":
        command => "echo ${32line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${32lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 32",
      }
    }
    define 4_1_4_64 {
      exec {"4_1_4_64 $title":
        command => "echo ${64line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${64lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 64",
      }
    }
    4_1_4_32 { [0, 1, 2]: } ->
    4_1_4_64 { [0, 1, 2, 3, 4]: } ->
    notify{ "CIS Benchmark 4.1.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.4 : $cis_benchmark_4_1_4")
  }
}
