file_path = 'vocab/italian.txt'
translations = {}
seen = []

File.open(file_path, 'r') do |file|
  # Skip the header row
  header = file.gets
  file.each_line do |line|
   # Split the line by tab character
    parts = line.split("\t") 
    
    # Extract Italian and English words and assign them the number
    italian = parts[1].strip
    english = parts[2].strip
    
    # Store the Italian word and its English translation in the hash
    translations[italian] = english
  end
end

# Output the translations hash
#puts translations

class Question
 attr_accessor :answer, :choices, :choices_map

 def initialize(translations, seen)     
   
   seen.each do |key|
   translations.delete(key)
   end

   @answer = translations.keys.sample

   @choices = translations.keys.sample(3)
   @choices << @answer
   @choices.shuffle!

   @choices_map = {
     'a' => @choices[0],
     'b' => @choices[1],
     'c' => @choices[2],
     'd' => @choices[3]
     }
 end

 def correct?(submitted, translations)
   result = translations[submitted.downcase.chomp.strip.downcase] == translations[@answer]
   result = translations[@choices_map[submitted.downcase.chomp.strip.downcase]] == translations[@answer]
   if not result
     puts " \n #{@answer} is the answer \n "
   else 
     puts 'correct'
   end
 end
end

for i in 0...5
  #begin test
  test = Question.new(translations, seen)
  system("clear")
  puts "#{translations[test.answer]} \n "
  seen.append(test.answer)
  
  test.choices_map.each do |letter, word|
  puts "#{letter}. #{word}"
end
  submitted = nil
  while !['a', 'b', 'c', 'd'].include?(submitted)
  submitted = $stdin.gets.chomp
  end

  test.correct?(submitted, translations)
  sleep(1)       
  system("clear")
end
