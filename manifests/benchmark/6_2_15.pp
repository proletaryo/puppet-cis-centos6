# 6.2.15    Ensure users own their home directories (Scored)
class ciscentos6::benchmark::6_2_15 {
  if $cis_benchmark_6_2_15 == 'failed' {   # remediate
    exec {'6_2_15 remediate':
      command => "
        for i in \$(cut -s -d: -f4 /etc/passwd | sort -u ); do
          grep -q -P \"^.*?:[^:]*:\$i:\" /etc/group
          if [ \$? -ne 0 ]; then
            echo \"Group \$i is referenced by /etc/passwd but does not exist in /etc/group\"
            groupadd -g \$i group\$i
          fi
        done
      ",
      path    => "/bin:/sbin:/usr/bin:/usr/sbin",
      provider => shell,
    } ->
    notify{ "CIS Benchmark 6.2.15 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.15 : $cis_benchmark_6_2_15")
  }
}
