directory_path = File.join(__dir__, "vocab")
# Check if the directory exists
if Dir.exist?(directory_path)
  puts "Files in directory '#{directory_path}':"

  # Initialize a hash to store languages
  languages_hash = {}
  index = 0

  # Iterate over each file in the directory
  Dir.foreach(directory_path) do |file|
    next if file == '.' || file == '..'
    puts "#{index + 1}. #{file}"
    languages_hash[index + 1] = file.chomp('.txt')  # Store the language without the .txt extension
    index += 1
  end

  # Prompt user to select a language
  puts "Select a language by number:"
  language_index = nil

  while !languages_hash.key?(language_index)
    language_index = $stdin.gets.chomp.to_i
  end
  language = languages_hash[language_index]
else
  puts "Error: Directory '#{directory_path}' does not exist."
  exit
end

file_path = "#{directory_path}/#{language}.txt"
translations = {}
seen = []

File.open(file_path, 'r') do |file|
  # Skip the header row
  header = file.gets
  file.each_line do |line|
   # Split the line by tab character
    parts = line.split("\t") 
    
    # Extract target_language and English words and assign them the number
    target_language = parts[1].strip
    english = parts[2].strip
    
    # Store the target_language word and its English translation in the hash
    translations[target_language] = english
  end
end

# Output the translations hash

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
  # Begin test
  current_question = Question.new(translations, seen)
  system("clear")
  puts "#{i+1}. #{translations[current_question.answer]} \n "
  seen.append(current_question.answer)

  current_question.choices_map.each do |letter, word|
    puts "#{letter}. #{word}"
  end
  submitted = nil
  while !['a', 'b', 'c', 'd'].include?(submitted)
    submitted = $stdin.gets.chomp
  end

  current_question.correct?(submitted, translations)
  sleep(1)
  system("clear")
  index += 1
end

