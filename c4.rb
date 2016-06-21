class Connect4    
   def initialize
       @board= Board.new
       @player1= Player.new("aash","X",@board)
       @player2= Player.new("calvin","O",@board)
       @currentplayer=@player1
   end

   def play
       while true
           @board.render
           @currentplayer.get_coordinates
           if game_over?
               break
           end
           switch_players
       end
   end

   def game_over?
       # if check_tie || check_win
       if check_win?
           return true
       else 
           return false
       end
   end

   # def check_tie?
   #     if @board.full 
   #         true
   #     else 
   #         false
   #     end
   # end

   def check_win?
       if @board.winning_combination
           true
       else 
           false
       end
   end

   def switch_players
       if @currentplayer==@player1
           @currentplayer=@player2
       else
           @currentplayer==@player1
       end
   end
end

c4=Connect4.new
c4.play