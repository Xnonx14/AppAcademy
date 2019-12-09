require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos 
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end

  #evaluator is the computer's mark
  def losing_node?(evaluator)
    #puts "#{@board.winner}:  #{evaluator}"   
    if @board.over?
      if @board.winner != evaluator
        return true
      elsif @board.winner == nil || @board.winner == evaluator
        return false
      end
    end
    
    if next_mover_mark == evaluator
      return self.children.all? {|child| child.losing_node?(evaluator)}
    else
      return self.children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      if @board.winner == evaluator
        return true
      elsif @board.winner == nil || @board.winner != evaluator
        return false
      end
    end

    if next_mover_mark == evaluator
      return self.children.any? {|child| child.winning_node?(evaluator)}
    else
      return self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  def self.getNextMark(current)
    if current == :x
      return :o
    else
      return :x

    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    results = []
    (0...3).each do |i|
      (0...3).each do |j|
        if (@board[[i,j]] == nil)
          tempboard = @board.dup
          tempboard[[i,j]] = @next_mover_mark
          results << TicTacToeNode.new(tempboard, TicTacToeNode.getNextMark(@next_mover_mark),[i,j])
        end
      end  
    end
    return results
  end
end

#p node.children