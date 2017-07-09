
lambda { |stdout,stderr,status|
  output = stdout + stderr
  return :red   if /\*\*\* (\d+) failure is detected/.match(output)
  return :red   if /\*\*\* (\d+) failures are detected/.match(output)
  return :green if /\*\*\* No errors detected/.match(output)
  return :amber
}
