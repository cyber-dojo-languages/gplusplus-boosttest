
lambda { |stdout,stderr,status|
  output = stdout + stderr
  return :red   if /\*\*\* 1 failure is detected in/.match(output)
  return :red   if /\*\*\* (\d+) failures are detected in/.match(output)
  return :green if /\*\*\* No errors detected/.match(output)
  return :amber
}
