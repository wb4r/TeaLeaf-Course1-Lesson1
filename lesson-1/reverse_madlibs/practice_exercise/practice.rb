# Read the input file sometext.txt
# Create IFs for empty? and exists?
# Substitute NOUN with WORD
# Substitute NOUN with dict_hash
# Read nouns.txt
# Substitute dict_hash with nouns.txt

# ERRORS
puts "File not provided!" and exit if ARGV.empty?
puts "File not existant!" and exit if !File.exists?(ARGV[0]) 


def say(msg)
  puts "=> "
end

def exit_with(msg)
end

def reading_file(file_name)
  File.open(file_name, 'r') do |f|
    f.read
  end.split
end


# Creating contents and lists
contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

nouns_list = reading_file("nouns.txt")
verbs_list = reading_file("verbs.txt")
adj_list = reading_file("adj.txt")

dict = {
  nouns: nouns_list,
  verbs: verbs_list,
  adj: adj_list
}


# CONVERTING nouns, verbs and adjs
contents.gsub!("NOUN").each do
  dict[:nouns].sample
end
contents.gsub!("VERB", dict[:verbs].sample)
contents.gsub!("ADJECTIVE", dict[:adj].sample)


puts contents

