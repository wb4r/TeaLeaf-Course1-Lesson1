a = [[1, 2], [3]]
b = [4, 5]


begin

var_a = a.sample
p "A: #{var_a}"
p var_a.length

rescue
var_b = a.sample
p "B: #{var_b}"
p var_b.length

rescue

p "C: #{a.sample.sample}"

end