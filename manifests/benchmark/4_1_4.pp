# 4.1.4    Ensure events that modify date and time information are collected (Scored)
class ciscentos6::benchmark::4_1_4 {
  if $cis_benchmark_4_1_4 == 'failed' {   # remediate
    $addline32 = '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change\\n-a always,exit -F arch=b32 -S clock_settime -k time-change\\n-w /etc/localtime -p wa -k time-change'
    $addline64 = '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change\\n-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change\\n-a always,exit -F arch=b64 -S clock_settime -k time-change\\n-a always,exit -F arch=b32 -S clock_settime -k time-change\\n-w /etc/localtime -p wa -k time-change'
    exec {'32bit add to audit.rules':
      command => "echo -e $addline32 >> /etc/audit/audit.rules",
      path    => "/bin:/sbin",
      onlyif  => "uname -m | grep 32"
    } ->
    exec {'64bit add to audit.rules':
      command => "echo -e $addline64 >> /etc/audit/audit.rules",
      path    => "/bin:/sbin",
      onlyif  => "uname -m | grep 64"
    } ->
    notify{ "CIS Benchmark 4.1.4 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.4 : $cis_benchmark_4_1_4")
  }
}
