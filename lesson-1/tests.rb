
CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'scissors'}
var = 'p'
#def winner(var)
  
  CHOICES.each do |k, v|
    if var == k then var = CHOICES[k][v] end
  end
  puts var
  
  
  
#end  

#winner('p')

#puts CHOICES[var]