class Hangman
  def initialize
    @words = File.open('google-10000-english-no-swears.txt')
    @replaced_words = {}
    @selected_word = ''
    @offuscate_word = ''
    @array_words = []
  end

  def load_game
    parse_lines
    @offuscate_word = replace_randomly(select_word)
    puts @selected_word
    puts @offuscate_word
    while @offuscate_word.include?('_')
      puts "Put a letter \n"
      letter = gets.chomp
      letter_checker(letter)
    end
    puts "CONGRATS YOU WON the word was #{@offuscate_word  }"
  end

  def letter_checker(letter)
    letter_to_replace = @replaced_words.select { |_k, v| v == letter }
    return puts "the letter #{letter} dont match \n" if letter_to_replace.none?

    letter_to_replace.each { |k, v| @offuscate_word[k] = v }
    puts letter_to_replace
    puts "NEW WORD: #{@offuscate_word}"
  end

  def replace_randomly(word)
    for i in 1..3 do
      random_number = rand(word.length - 1)

      random_number = rand(word.length - 1) until word[random_number] != '_'
      @replaced_words[random_number] = word[random_number]
      word[random_number] = '_'

    end
    word
  end

  def select_word
    random_number = rand(@array_words.length - 1)
    @array_words[random_number]
  end

  def parse_lines
    @words.each_line do |w|
      w = w.chomp # remove the newline character
      @array_words.push(w) if w.length >= 5 && w.length <= 12
    end
    @array_words
  end
end
