# 6.2.9    Ensure users own their home directories (Scored)
class ciscentos6::benchmark::6_2_9 {
  if $cis_benchmark_6_2_9 == 'failed' {   # remediate
    exec {'6_2_9 remediate':
      command => "
        cat /etc/passwd | awk -F: '{ print \$1 \" \" \$3 \" \" \$6 }' | while read user uid dir; do
          if [ \$uid -ge 500 -a -d \"\$dir\" -a \$user != \"nfsnobody\" ]; then
            owner=\$(stat -L -c \"%U\" \"\$dir\")
            if [ \"\$owner\" != \"\$user\" ]; then
              chown \$user \$dir
            fi
          fi
        done
      ",
      path    => "/bin:/sbin:/usr/bin",
      provider => shell,
    } ->
    notify{ "CIS Benchmark 6.2.9 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.9 : $cis_benchmark_6_2_9")
  }
}
