require("byebug")
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {'_'}
    @attempted_chars = Array.new(0)
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = Array.new(0)
    # debugger
    @secret_word.each_char.with_index do |c, i|
      indices << i if c == char
    end
    indices
  end
  def fill_indices(char, indices)
    indices.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted" 
      return false
    end
    @attempted_chars << char
    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, get_matching_indices(char))
    end
    true
  end

  def ask_user_for_guess 
    p 'Enter a char:'
    try_guess(gets.chomp)
  end
  def win?
    # debugger
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    end
    false
  end
  def lose?
    if @remaining_incorrect_guesses == 0 
      p "LOSE"
      return true
    end
    false
  end
  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return self.win? ? self.win? : self.lose?
    end
    false
  end
end
