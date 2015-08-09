require 'pry'

comp_choices = [1]
user_choices = [5, 6]
WINNING_RESULTS = {1=>[1,2,3], 2=>[4,5,6], 3=>[7,8,9], 4=>[1,4,7], 5=>[2,5,8], 6=>[3,6,9], 7=>[1,5,9], 8=>[3,5,7]}
numbers_left_to_win = []
tunnel = []



  
WINNING_RESULTS.each do |key, solutions|
  numbers_left_to_win << WINNING_RESULTS[key] - comp_choices - user_choices
end

WINNING_RESULTS.each do |key, solutions|
  numbers_left_to_win.each_index do |x|
    #tunnel = comp_choices.sort! + numbers_left_to_win[x].sort!
    #tunnel.sort!
    binding.pry
    if (numbers_left_to_win[x] + comp_choices).sort == WINNING_RESULTS[key]
    # OR => if tunnel == WINNING_RESULTS[key]
      comp_choices << numbers_left_to_win[x]
    end
  end
end


=begin  
  Hi guys, I have been with this issue more than 3 hours now. I've looked in SO and I've tried several things. First I'll explain the error and then I'll try to explain
  what I already tried. It is possible that I tried something that I might forget to write now, this issue and me (and others before this one) has left me with a wrong 
  sense of time and a damaged memory ;)
  
  In the line of the 'if statement' it gives this error:
  
    /home/ubuntu/workspace/lesson-1/tests.rb:28:in `sort!': comparison of Fixnum with Array failed (ArgumentError)                                                                                              
          from /home/ubuntu/workspace/lesson-1/tests.rb:28:in `block (2 levels) in <main>'                                                                                                                    
          from /home/ubuntu/workspace/lesson-1/tests.rb:26:in `each_index'                                                                                                                                    
          from /home/ubuntu/workspace/lesson-1/tests.rb:26:in `block in <main>'                                                                                                                               
          from /home/ubuntu/workspace/lesson-1/tests.rb:25:in `each'                                                                                                                                          
          from /home/ubuntu/workspace/lesson-1/tests.rb:25:in `<main>'       
  The variable 'tunnel' its just to try a different approach, you can delete the two lines referencing to it because it gives the same error. I tried apart from '+', 
  concat and '<<'. I also tried with a binding.pry just before the if statement and that's what annoyes me most. 
  
  If within pry I analize numbers_left_to_win[x].class, comp_choices.class and WINNING_RESULTS[key].class they all give 'Array'.
  If within pry I do => (numbers_left_to_win[x] + comp_choices).sort it works
  If within pry I do => (numbers_left_to_win[x] + comp_choices).sort == WINNING_RESULTS[key]   it gives TRUE.
  
  I don't understand anything here...
  Just let me add that I am using cloud9 Ruby 1.9, and Windows-based Ruby2.x and both gave the same.
  
  
  Thanks a lot. I will apreciate any hint, help or any dragon ball that aids me with this mistery!
    
=end