require_relative 'board'
require_relative 'player'

class TicTacToe

    def initialize(*size)
        bsize = 3
        bsize = size[0] if size[0] != nil
        @board = Board.new(bsize)
        @player_1 = Player.new(:X)
        @player_2 = Player.new(:O)
        @current_player = @player_1
    end

    def switch_players!()
        if @current_player != @player_2
            @current_player = @player_2 
        else 
            @current_player = @player_1 
        end 
    end

    def play_turn()
        position = @current_player.get_position()
        @board[position] = @current_player.mark
        switch_players!
    end

    # This TicTacToe#play method is given for free and does not need to be modified
    # It is used to make your game playable.
    def play
        until @board.winner?(:X) || @board.winner?(:O)
            p "#{@current_player.mark}'s turn"
            @board.print
            self.play_turn
        end

        @board.print
        self.switch_players!
        p "#{@current_player.mark} has won!"
    end
end
