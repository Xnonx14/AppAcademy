require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    #@player1 = Player.new(name1,1)  #0-6
    #@player2 = Player.new(name2,2)  #7-13
    @cups = Array.new(14) {
      Array.new(4){
        :stone
      }
    }
    @cups[6] = []
    @cups[13] = []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
      raise "Invalid starting cup" if start_pos < 0 || start_pos >= 13
      raise "Starting cup is empty" if @cups[start_pos].empty?
      raise "Invalid starting cup" if start_pos == 6 
      return true
      
  end 

  def make_move(start_pos, current_player_name)
    count = @cups[start_pos].length
    @cups[start_pos] = [] 
    index = start_pos + 1
    while count > 0 
      #THIS ASSUMES THAT IT IS SAFE TO PLACE A STONE
      if index == 13 && current_player_name == @name1
        index += 1
      elsif(index == 6 && current_player_name == @name2)
        index += 1
      end
      @cups[index%cups.length] << :stone
      index += 1
      count -= 1 
    end
    render()
    next_turn(index-1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return ending_cup_idx if @cups[ending_cup_idx % @cups.length].length > 1
    return :switch if @cups[ending_cup_idx % @cups.length].length == 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0...6].all? {|cup| cup.empty?} || @cups[7...13].all? {|cup| cup.empty?}
    
    return false
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @name1 
    else
      return @name2
    end
  end
end

board = Board.new("Erica", "James")
board.make_move(0, "Erica")
board.make_move(12, "Erica")
