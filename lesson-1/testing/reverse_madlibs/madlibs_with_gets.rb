def say(msg)
 puts "=> #{msg}"
end

def exit_with(msg)
 say msg
 exit
end

exit_with("No file input!") if ARGV.empty?
exit_with("File non existant!") if !File.exists?(ARGV[0])


################################################

# Open file to read
contents = File.open(ARGV[0], 'r') do |f|
  f.read
end


# Create nouns, adjective and verbs list
nouns_list = File.open(ARGV[0], 'r') do |file|
  file.read
end

verbs_list = File.open("verbs.txt", 'r') do |file|
  file.read.split
end

adj_list = File.open("adj.txt", 'r') do |file|
  file.read.split
end

################################################
# Doing it this way (up) instead of how we did #
# it in madlibs_with_read is that like this it #
# will be automatically closed (files) after   #
# do..end                                      #
################################################



# Gsub the exercise!
contents.gsub!("NOUN").each do 
  puts "Input a NOUN:"
  STDIN.gets.chomp
end
contents.gsub!("VERB", verbs_list.sample)
contents.gsub!("ADJECTIVE", adj_list.sample)

p contents


