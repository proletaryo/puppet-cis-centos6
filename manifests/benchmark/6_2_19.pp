# 6.2.19    Ensure no duplicate group names exist (Scored)
class ciscentos6::benchmark::6_2_19 {
  if $cis_benchmark_6_2_19 == 'failed' {   # remediate
    exec {'6_2_19 remediate':
      command => "
        cat /etc/group | cut -f1 -d\":\" | sort -n | uniq -c | while read x ; do
          [ -z \"\${x}\" ] && break
          set - \$x
          if [ \$1 -gt 1 ]; then
            gids=`gawk -F: '(\$1 == n) { print \$3 }' n=\$2 /etc/group | xargs`
            for gid in \$gids; do
              sed -i \"s/^\$2:\\([^:]:\${gid}:\\)/\$2\${gid}:\\1/\" /etc/group
            done
          fi
        done
      ",
      path    => "/bin:/sbin:/usr/bin:/usr/sbin",
      provider => shell,
    } ->
    notify{ "CIS Benchmark 6.2.19 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.19 : $cis_benchmark_6_2_19")
  }
}
