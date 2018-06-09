
lambda { |stdout,stderr,status|
  output = stdout + stderr
  return :red   if /\*\*\* (\d+) failure(s?) detected in/.match(output)
  return :green if /\*\*\* No errors detected/.match(output)
  return :amber
}
