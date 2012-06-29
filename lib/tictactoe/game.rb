class Game
    
  def initialize
    @cells = []
    @player_turn = 'O'
  end
  
  def mark_position(position)
    return false if @cells[position] != nil
    @cells[position] = @player_turn
    change_player_turn
    true
  end
  
  def marked?(position)
    @cells[position] != nil
  end
  
  def marked_with?(position)
    @cells[position]
  end
  
  def change_player_turn
    if(@player_turn == 'O')
      @player_turn = 'X'
    else
      @player_turn = 'O'
    end
  end
  
  def ended?
    0.step(6, 3) do |position|
      final_position = position + 2
      return true if verify_row(position..final_position)
    end
        
    (0..2).each do |column|
      return true if verify_column(column)
    end
    
    return true if verify_diagonal
  end
  
  private
  def verify_row(positions)
    verify_row_and_move(positions, 'O') or verify_row_and_move(positions, 'X')
  end
  
  def verify_row_and_move(positions, move)
    positions.each do |position|
      return false if marked_with?(position) != move
    end
    true
  end
  
  def verify_column(column)
    verify_column_and_move(column, 'O') or verify_column_and_move(column, 'X')
  end
  
  def verify_column_and_move(column, move)
    column.step(8, 3) do |position|
      return false if marked_with?(position) != move
    end
    true
  end
  
  def verify_diagonal
    verify_diagonal_and_move('O') or verify_diagonal_and_move('X')
  end
  
  def verify_diagonal_and_move(move)
    positions_have_same_move?(0, 8, 4, move) or positions_have_same_move?(2, 6, 2, move)
  end
  
  def positions_have_same_move?(initial, final, step, move)
    initial.step(final, step) do |position|
      return false if marked_with?(position) != move
    end
    true
  end
end