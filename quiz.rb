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
 attr_accessor :answer, :choices

 def initialize(translations, seen) 
   @answer = translations.keys.sample
 
   seen.each do |key|
   translations.delete(key)
   end

   @choices = translations.keys.sample(3)
   @choices << @answer
   @choices.shuffle!

 end

 def correct?(submitted, translations)
   translations[submitted.downcase.chomp.strip.downcase] == translations[@answer]
 end

end

 test = Question.new(translations, seen)

for i in 1...5
  #begin test
  test = Question.new(translations, seen)
  puts "#{translations[test.answer]} \n "
  puts test.choices
  puts
  submitted = $stdin.gets
  puts
  puts test.correct?(submitted, translations)
  puts
end

