=begin

a = 'hi there'
b = a
a.gsub!(' ', '_')
puts b 
# hi_there


a = 'hi there'
b = a
a = [1, 2, 3]
puts b 
# hi there

The main difference is that in the second example the caller is not changed.
a = memory_space and b = to_the_same_memory_space. When a = array, the
memory space assignated changes to a new one and b is not affected. In the
first example is different because there is no new memory space. Instead
of that, while a and b are pointing to the same memory space, a uses
gsub! (destructive) and affects the memory space where a and b are pointing.

=end