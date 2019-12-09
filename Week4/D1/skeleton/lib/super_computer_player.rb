require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    board = game.board
    root = TicTacToeNode.new(board, mark)
    if(root.winning_node?(mark))
      return root.children.select {|child| child.winning_node?(mark)}[0].prev_move_pos
    end
    moves = root.children.select do |child| 
      child.losing_node?(TicTacToeNode.getNextMark(mark))
    end    
    return moves[0].prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
