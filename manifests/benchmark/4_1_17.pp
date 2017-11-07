# 4.1.17    Ensure kernel module loading and unloading is collected (Scored)
class ciscentos6::benchmark::4_1_17 {
  if $cis_benchmark_4_1_17 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $32line = [
      '-w /sbin/insmod -p x -k modules',
      '-w /sbin/rmmod -p x -k modules',
      '-w /sbin/modprobe -p x -k modules',
      '-a always,exit arch=b32 -S init_module -S delete_module -k modules'
    ]
    $32lineregex = [
      '^-w\\s*/sbin/insmod\\s*-p\\s*x\\s*-k\\s*modules',
      '^-w\\s*/sbin/rmmod\\s*-p\\s*x\\s*-k\\s*modules',
      '^-w\\s*/sbin/modprobe\\s*-p\\s*x\\s*-k\\s*modules',
      '^-a\\s*always,exit\\s*arch=b32\\s*-S\\s*init_module\\s*-S\\s*delete_module\\s*-k\\s*modules'
    ]
    $64line = [
      '-w /sbin/insmod -p x -k modules',
      '-w /sbin/rmmod -p x -k modules',
      '-w /sbin/modprobe -p x -k modules',
      '-a always,exit arch=b64 -S init_module -S delete_module -k modules'
    ]
    $64lineregex = [
      '^-w\\s*/sbin/insmod\\s*-p\\s*x\\s*-k\\s*modules',
      '^-w\\s*/sbin/rmmod\\s*-p\\s*x\\s*-k\\s*modules',
      '^-w\\s*/sbin/modprobe\\s*-p\\s*x\\s*-k\\s*modules',
      '^-a\\s*always,exit\\s*arch=b64\\s*-S\\s*init_module\\s*-S\\s*delete_module\\s*-k\\s*modules'
    ]
    define 4_1_17_32 {
      exec {"4_1_17_32 $title":
        command => "echo ${32line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${32lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 32",
      }
    }
    define 4_1_17_64 {
      exec {"4_1_17_64 $title":
        command => "echo ${64line[$title]} >> $filepath",
        path    => "/bin:/sbin",
        unless  => "grep -P ${64lineregex[$title]} $filepath",
        onlyif  => "uname -m | grep 64",
      }
    }
    4_1_17_32 { [0, 1, 2, 3]: } ->
    4_1_17_64 { [0, 1, 2, 3]: } ->
    notify{ "CIS Benchmark 4.1.17 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.17 : $cis_benchmark_4_1_17")
  }
}
