def question (quest , ans )
  1.times do
    puts quest
    a = gets.chomp
    if a == ans
      puts "good job"
    else
      puts "Try Again!"
      redo
    end
  end
end

question(quest, ans)