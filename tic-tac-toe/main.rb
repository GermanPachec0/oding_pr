require_relative 'board'
require_relative 'player'

def main
  puts 'GAME FINISHED'

  player1 = Player.new('Gonzalo')
  player2 = Player.new('German')
  players_keys = {}
  players_keys[player1.name] = player1
  players_keys[player2.name] = player2

  game = Board.new(players_keys)

  game.run_game
end

main
