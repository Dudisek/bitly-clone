data = []

File.open("urls", "r").each_line do |line|
  # name: "Angela"    job: "Writer"    ...
  data << line.gsub(/[(,)]/i, '')
end

# data = data.gsub(/[(,)]/i, '')
puts data