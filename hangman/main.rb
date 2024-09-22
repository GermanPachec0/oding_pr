require_relative 'hangman'

def main
  h = Hangman.new
  h.load_game
end

main
