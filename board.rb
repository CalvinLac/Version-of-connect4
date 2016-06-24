#Class to enable transpose
class Array
  def safe_transpose
    max_size = self.map(&:size).max
    self.dup.map{|r| r << nil while r.size < max_size; r}.transpose
  end
end


#Main class that handles the game board 
class Board
   def initialize
       @board = Array.new(7){Array.new(6, "z")}
       @counter = 0
       @column=0
       @rowcoordinate=0
   end

#Main render function   
   def render
       puts "--------- CONNECT 4 ---------"
       puts "-----------------------------"
       @board.safe_transpose.each do |row|
           row.each do |cell|
               print "|"
               if cell == "z"
                 print("---")
               else
                 print(" #{cell.to_s} ")
               end
           end
       print "|"
       puts
       puts "-----------------------------"
       end
    end
   

   def add_piece(column,symbol)
       @column=column
       if column_avaliable?
          i=6
          while true
            if @board[column.to_i][i] == "z"
              @board[column.to_i][i]= symbol
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
       if @board[@column.to_i].size <=6
           return true
       else
           return false
       end
   end

   def full?
    if (@board[0][0] != "z" && @board[1][0] != "z" && @board[2][0] != "z" && @board[3][0] != "z" && @board[4][0] != "z" && @board[5][0] != "z" && @board[6][0] != "z")
      return true
      else
      return false
      end
   end  


   def winning_combination?
       winning_vertical? || winning_horizontal? || winning_diagonal?
   end


   def winning_vertical?
       verticalarray=[@board[@column.to_i][5],@board[@column.to_i][4],@board[@column.to_i][3],
       @board[@column.to_i][2],@board[@column.to_i][1],@board[@column.to_i][0]]
       four_in_a_row?(verticalarray)
   end


   def four_in_a_row?(arr)
       arr.join.to_s.include?("XXXX") || arr.join.to_s.include?("OOOO")
   end


   def winning_horizontal?
      horizontalarray=[@board[0][@rowcoordinate],@board[1][@rowcoordinate],
      @board[2][@rowcoordinate],@board[3][@rowcoordinate],@board[4][@rowcoordinate],
      @board[5][@rowcoordinate], @board[6][@rowcoordinate]]
      four_in_a_row?(horizontalarray)
   end


#Hard code for the winning conditions of diagonal
   def winning_diagonal?
      left1_column_checker = @column.to_i
      left2_column_checker = @column.to_i
      right_column_checker = @column.to_i
      row1 = @rowcoordinate.to_i
      row2 = @rowcoordinate.to_i
      
      left1pusher = []
      one =1
      two =2 

      n = 0 
      until n==4
        left1 = []
        left1pusher = @board[one][two]
        left1 << left1pusher
        n+=1
        one +=1
        two +=1 
      end 


      m = 0 
      until m==4
        left2 = []
        left2pusher = [@board[left2_column_checker.to_i][row2.to_i]]
        left2.push left2pusher
        m+=1
        [left2_column_checker +=1]
        [row2 +=1] 
      end 

      four_in_a_row?(left1)
    end 





     # d1 = [@board[3][5],@board[2][4],@board[1][3],@board[0][2]]
     # d2 = [@board[4][5],@board[3][4],@board[2][3],@board[1][2],@board[0][1]]
     # d3 = [@board[5][5],@board[4][4],@board[3][3],@board[2][2],@board[1][1],@board[0][0]]
     # d4 = [@board[0][0],@board[1][1],@board[2][2],@board[3][3],@board[4][4],@board[5][5]]
     # d5 = [@board[2][0],@board[3][1],@board[4][2],@board[5][3],@board[6][4]]
     # d6 = [@board[3][0],@board[4][1],@board[5][2],@board[6][3]]
     # d7 =[@board[6][2],@board[5][3],@board[4][4],@board[3][5]]
     # d8 =[@board[6][1],@board[5][2],@board[4][3],@board[3][4],@board[2][5]]
     # d9 =[@board[6][0],@board[5][1],@board[4][2],@board[3][3],@board[2][4], @board[1][5]]
     # d10 = [@board[5][0], @board[4][1], @board[3][2], @board[2][3], @board[1][4], @board[0][5]]
     # d11 = [@board[4][0], @board[3][1], @board[2][2], @board[1][3], @board[0][4]]
     # d12 = [@board[3][0], @board[2][1], @board[1][2], @board[0][3]]

     # array_diagonals = [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12]
     # array_diagonals.each { |current_diagonal|
     #   if four_in_a_row?(current_diagonal)
     #     return true
     #   end

     #   }
     # return false



end