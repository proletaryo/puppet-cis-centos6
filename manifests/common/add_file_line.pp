# NOTE: common resource for these benchmarks
# 1.2.3    Ensure gpgcheck is globally activated (Scored)
# 1.3.2    Ensure filesystem integrity is regularly checked (Scored)
# 1.4.3    Ensure authentication required for single user mode (Scored)
# 1.4.4    Ensure interactive boot is not enabled (Scored)
# 1.5.1    Ensure core dumps are restricted (Scored)
# 1.5.3    Ensure address space layout randomization (ASLR) is enabled (Scored)
# 1.6.1.2    Ensure the SELinux state is enforcing (Scored)
# 1.6.1.3    Ensure SELinux policy is configured (Scored)
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
# 4.1.1.2   Ensure system is disabled when audit logs are full (Scored)
# 4.1.1.3   Ensure audit logs are not automatically deleted (Scored)
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
