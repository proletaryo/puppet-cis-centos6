# 4.1.18    Ensure system administrator actions (sudolog) are collected (Scored)
class ciscentos6::benchmark::4_1_18 {
  if $cis_benchmark_4_1_18 == 'failed' {   # remediate
    $filepath = '/etc/audit/audit.rules'
    $lineadd = '-e 2'
    $lineedit = '\'-e 2\''
    $lineregexadd = '^-e \+[#]*'
    $lineregex = '^-e\\s+[#]*'
    exec {"4_1_18 edit":
      command => "sed -i '/$lineregexadd/c\\$lineadd' $filepath",
      path    => "/bin:/sbin",
      onlyif  => "grep -P $lineregex $filepath",
    } ->
    exec {"4_1_18 add":
      command => "echo $lineedit >> $filepath",
      path    => "/bin:/sbin",
      unless  => "grep -P $lineregex $filepath",
    } ->
    notify{ "CIS Benchmark 4.1.18 : remediated":
      loglevel => notice,
    }
  }
  else {
    notice( "CIS Benchmark 4.1.18 : $cis_benchmark_4_1_18")
  }
}
