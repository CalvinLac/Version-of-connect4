class Board 
   def initialize
       @board = Array.new(6){Array.new(7)}
       @counter = 0
       @column=0
       @rowcoordinate=0
   end
   
   def render
       puts 
       # if @counter>0
       #     monkey_around
       #     counter += 1 
       # end
       @board.each do |row|
           row.each do |cell|
               cell.nil? ? print("-") : print(cell.to_s)
           end
       puts
       end
       puts
       # monkey_around
   end
   # def monkey_around
   #     @board=[[@board[0][0],@board[1][0],@board[2][0],@board[3][0],@board[4][0],@board[5][0]],
   #         [@board[0][1],@board[1][1],@board[2][1],@board[3][1],@board[4][1],@board[5][1]],
   #         [@board[0][2],@board[1][2],@board[2][2],@board[3][2],@board[4][2],@board[5][2]],
   #         [@board[0][3],@board[1][3],@board[2][3],@board[3][3],@board[4][3],@board[5][3]],
   #         [@board[0][4],@board[1][4],@board[2][4],@board[3][4],@board[4][4],@board[5][4]],
   #         [@board[0][5],@board[1][5],@board[2][5],@board[3][5],@board[4][5],@board[5][5]]]
   # end
   def add_piece(column,symbol)
       @column=column
       if column_avaliable?
            i=6
            while true
                if @board[column.to_i][i] == nil
                    @board[column.to_i][i] = symbol
                    @rowcoordinate=i
                    break
                else
                    i-=1
                    next
                end
            end
            return true 
       else
           false
       end
   end
   def column_avaliable?
       if @board[@column.to_i].size <=7 
           return true 
       else 
           return false 
       end
   end
   def winning_combination?
       winning_vertical? || winning_horizontal?
       #winning_diagonal? || winning_vertical? || winning horizontal?
   end
   def winning_vertical?
       verticalarray=[@board[@column.to_i][6],@board[@column.to_i][5],@board[@column.to_i][4],@board[@column.to_i][3],@board[@column.to_i][2],@board[@column.to_i][1],@board[@column.to_i][0]]
       four_in_a_row?(verticalarray)
   end
   def four_in_a_row?(arr)
       arr.join.to_s.include?("XXXX") || arr.join.to_s.include?("OOOO")
   end

  def winning_horizontal?
      horizontalarray=[@board[0][@rowcoordinate],@board[1][@rowcoordinate],@board[2][@rowcoordinate],@board[3][@rowcoordinate],@board[4][@rowcoordinate],@board[5][@rowcoordinate]]
      four_in_a_row?(horizontalarray)
   end


end