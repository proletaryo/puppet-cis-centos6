# 6.2.5    Ensure root is the only UID 0 account (Scored)
class ciscentos6::benchmark::6_2_5 {
  if $cis_benchmark_6_2_5 == 'failed' {   # remediate
    exec {'6_2_5 remediate':
      command => "
        userlist=\$(cat /etc/passwd | awk -F: '(\$3 == 0 && \$1 != \"root\") { print \$1 }' | awk '{print \$0}')
        for user in \$userlist; do
          uid=\$(cat /etc/passwd | awk -F: '{ print \$3 }' | sort -n | tail -1 | awk '{print \$0+1}')
          if [ \$uid -lt 499 ]; then
            uid=\$(echo 499)
          fi
          sed -i \"s/^\\(\$user:[^:]\\):[0-9]*:/\\1:\$uid:/\" /etc/passwd
        done
      ",
      path    => "/bin:/sbin:/usr/bin",
      provider => shell,
    } ->
    notify{ "CIS Benchmark 6.2.5 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.5 : $cis_benchmark_6_2_5")
  }
}
