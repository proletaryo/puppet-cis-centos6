# NOTE: common resource for these benchmarks
# 1.2.3    Ensure gpgcheck is globally activated (Scored)
# 2.2.15    Ensure mail transfer agent is configured for local-only mode (Scored)
# 3.1.1    Ensure IP forwarding is disabled (Scored)
# 3.1.2    Ensure IP forwarding is disabled (Scored)
# 3.2.1    Ensure source routed packets are not accepted (Scored)
# 3.2.2    Ensure ICMP redirects are not accepted (Scored)
# 3.2.3    Ensure secure ICMP redirects are not accepted (Scored)
# 3.2.4    Ensure suspicious packets are logged (Scored)
# 3.2.5    Ensure broadcast ICMP requests are ignored (Scored)
# 3.2.6    Ensure bogus ICMP responses are ignored (Scored)
# 3.2.7    Ensure bogus ICMP responses are ignored (Scored)
# 3.2.8    Ensure TCP SYN Cookies is enabled (Scored)
# 3.3.1    Ensure IPv6 router advertisements are not accepted (Scored)
# 3.3.2    Ensure IPv6 redirects are not accepted (Scored)
define ciscentos6::common::add_file_line (
  $filepath, $addline, $regex
) {
  exec{'edit $filepath':
    command => "sed -i '/$regex/c\\$addline' $filepath",
    path    => "/bin:/sbin",
    onlyif  => "grep -P $regex $filepath",
  } ->
  exec{'add $filepath':
    command => "echo $addline >> $filepath",
    path    => "/bin:/sbin",
    unless  => "grep -P $regex $filepath",
  }
}
