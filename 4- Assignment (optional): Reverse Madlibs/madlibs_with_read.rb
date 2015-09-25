def say(msg)
 puts "=> #{msg}"
end

def exit_with(msg)
 say msg
 exit
end

exit_with("No file input!") if ARGV.empty?
exit_with("File non existant!") if !File.exists?(ARGV[0])

################

# Open file to read
contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

# Create nouns, adjective and verbs list
file_nouns = File.open("nouns.txt", "r")
nouns_list = file_nouns.read.split
file_verbs = File.open("verbs.txt", "r")
verbs_list = file_verbs.read.split
file_adj = File.open("adj.txt", "r")
adj_list = file_adj.read.split
file_nouns.close
file_verbs.close
file_adj.close

# Gsub the exercise!
contents.gsub!("NOUN").each do 
  nouns_list.sample
end
contents.gsub!("VERB", verbs_list.sample)
contents.gsub!("ADJECTIVE", adj_list.sample)

p contents


