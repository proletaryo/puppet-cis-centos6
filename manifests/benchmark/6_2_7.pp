# 6.2.7    Ensure all users' home directories exist (Scored)
class ciscentos6::benchmark::6_2_7 {
  if $cis_benchmark_6_2_7 == 'failed' {   # remediate
    exec {'6_2_7 remediate':
      command => "
        cat /etc/passwd | awk -F: '{ print \$1 \" \" \$3 \" \" \$6 }' | while read user uid dir;do
          if [ \$uid -ge 500 -a \"\$dir\" == \"\" -a \$user != \"nfsnobody\" ]; then
            echo \"User \$user does not have an assigned home directory.\"
            mkdir /home/\$user 2>/dev/null; chown \$user:\$user /home/\$user
            usermod -m -d /home/\$user \$user
          elif [ \$uid -ge 500 -a ! -d \"\$dir\" -a \$user != \"nfsnobody\" ]; then
            echo \"The home directory (\$dir) of user \$user does not exist.\"
            mkdir \$dir
            chown \$user:\$user \$dir
          fi
        done
      ",
      path    => "/bin:/sbin:/usr/bin:/usr/sbin",
      provider => shell,
    } ->
    notify{ "CIS Benchmark 6.2.7 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 6.2.7 : $cis_benchmark_6_2_7")
  }
}
