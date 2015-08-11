file = true
contents = true

file = file.open("sometext.txt", "r")
contents = file.read

puts contents

file.close
