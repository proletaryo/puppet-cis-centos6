# 4.1.6    Ensure events that modify the system's network environment are collected (Scored)
class ciscentos6::benchmark::4_1_6 {
  if $cis_benchmark_4_1_6 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $32line = [
      '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
      '-w /etc/issue -p wa -k system-locale',
      '-w /etc/issue.net -p wa -k system-locale',
      '-w /etc/hosts -p wa -k system-locale',
      '-w /etc/sysconfig/network -p wa -k system-locale'
    ]
    $32lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*sethostname\\s*-S\\s*setdomainname\\s*-k\\s*system-locale',
      '^-w\\s*/etc/issue\\s*-p\\s*wa\\s*-k\\s*system-locale',
      '^-w\\s*/etc/issue.net\\s*-p\\s*wa\\s*-k\\s*system-locale',
      '^-w\\s*/etc/hosts\\s*-p\\s*wa\\s*-k\\s*system-locale',
      '^-w\\s*/etc/sysconfig/network\\s*-p\\s*wa\\s*-k\\s*system-locale'
    ]
    $64line = [
      '-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale',
      '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
      '-w /etc/issue -p wa -k system-locale',
      '-w /etc/issue.net -p wa -k system-locale',
      '-w /etc/hosts -p wa -k system-locale',
      '-w /etc/sysconfig/network -p wa -k system-locale'
    ]
    $64lineregex = [
      '^-a\\s*always,exit\\s*-F\\s*arch=b64\\s*-S\\s*sethostname\\s*-S\\s*setdomainname\\s*-k\\s*system-locale',
      '^-a\\s*always,exit\\s*-F\\s*arch=b32\\s*-S\\s*sethostname\\s*-S\\s*setdomainname\\s*-k\\s*system-locale',
      '^-w\\s*/etc/issue\\s*-p\\s*wa\\s*-k\\s*system-locale',
      '^-w\\s*/etc/issue.net\\s*-p\\s*wa\\s*-k\\s*system-locale',
      '^-w\\s*/etc/hosts\\s*-p\\s*wa\\s*-k\\s*system-locale',
      '^-w\\s*/etc/sysconfig/network\\s*-p\\s*wa\\s*-k\\s*system-locale'
    ]
    define 4_1_6_32 {
      exec {"4_1_6_32 $title":
        command => "echo ${32line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${32lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 32",
      }
    }
    define 4_1_6_64 {
      exec {"4_1_6_64 $title":
        command => "echo ${64line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${64lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 64",
      }
    }
    4_1_6_32 { [0, 1, 2, 3, 4]: } ->
    4_1_6_64 { [0, 1, 2, 3, 4, 5]: } ->
    notify{ "CIS Benchmark 4.1.6 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.6 : $cis_benchmark_4_1_6")
  }
}
