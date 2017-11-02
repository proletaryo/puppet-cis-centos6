# NOTE: common resource for these benchmarks
# 3.1.1    Ensure IP forwarding is disabled (Scored)
# 3.1.2    Ensure IP forwarding is disabled (Scored)
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
