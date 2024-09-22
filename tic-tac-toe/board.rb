class Board
  @@actual_player = nil
  def initialize(players)
    @players = players
    @@actual_player = @players.first[1]
    @board = Array.new(3, '-') { Array.new(3, '-') }
  end

  def run_game
    print_board
    puts "Enter the value in the x position #{@@actual_player.name}"
    pos_x = gets.chomp
    puts "Enter the value in the y position #{@@actual_player.name}"
    pos_y = gets.chomp

    put_in_position(pos_x.to_i, pos_y.to_i)
    win = check_for_win(pos_x.to_i, pos_y.to_i)
    print_board
    until win

      puts "Enter the value in the x position #{@@actual_player.name}"
      pos_x = gets.chomp
      puts "Enter the value in the y position #{@@actual_player.name}"
      pos_y = gets.chomp

      win = put_in_position(pos_x.to_i, pos_y.to_i)

      print_board
      win = check_for_win(pos_x.to_i, pos_y.to_i)

    end
  end

  def put_in_position(x_pos, y_pos)
    @board[x_pos][y_pos] = @@actual_player.symbol
    return puts 'ES AN EQUAL GAME TRY IT AGAIN' if is_empate?
  end

  def check_for_win(pos_x, pos_y)
    pos = pos_x.to_s + pos_y.to_s
    is_win = false
    case pos
    when '00'
      if @board[0][1] == @@actual_player.symbol && @board[0][2] == @@actual_player.symbol ||
         @board[1][0] == @@actual_player.symbol && @board[2][0] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[2][2] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '01'
      if @board[0][0] == @@actual_player.symbol && @board[0][2] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[2][1] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '02'
      if @board[0][1] == @@actual_player.symbol && @board[0][0] == @@actual_player.symbol ||
         @board[1][2] == @@actual_player.symbol && @board[2][2] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[2][0] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '10'
      if @board[0][0] == @@actual_player.symbol && @board[2][0] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[1][2] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '11'
      if @board[0][0] == @@actual_player.symbol && @board[2][0] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[1][2] == @@actual_player.symbol ||
         @board[0][0] == @@actual_player.symbol && @board[2][2] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '12'
      if @board[0][2] == @@actual_player.symbol && @board[2][2] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[1][0] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '20'
      if @board[1][0] == @@actual_player.symbol && @board[0][0] == @@actual_player.symbol ||
         @board[2][1] == @@actual_player.symbol && @board[2][2] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[0][2] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '21'
      if @board[2][0] == @@actual_player.symbol && @board[2][2] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[0][1] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    when '22'
      if @board[1][2] == @@actual_player.symbol && @board[0][2] == @@actual_player.symbol ||
         @board[2][1] == @@actual_player.symbol && @board[2][0] == @@actual_player.symbol ||
         @board[1][1] == @@actual_player.symbol && @board[0][0] == @@actual_player.symbol
        puts "YOU WIN #{@@actual_player.name}"
        is_win = true
      end
      change_turn
      is_win
    else

      puts 'Invalid position'
      is_win
    end
  end

  def change_turn
    new_actual = @players.except(@@actual_player.name).first[1]
    @@actual_player = new_actual
  end

  def is_empate?
    count_empty_values = @board.flatten.select { |element| element == '-' }.count

    return true if count_empty_values == 0

    false
  end

  def print_board
    build_row = ''
    @board.each do |row|
      row.each do |_value|
        build_row += '' + _value
      end
      build_row = '|' + build_row + '|'
      puts build_row
      build_row = ''
    end
  end
end
