class Board 
	def initialize
		@board = Array.new(6){Array.new(7)}
		@counter = 0
		@column
		@rowcoordinate
	end
	
	def render
		puts 
		if @counter>0
			monkey_around
		end
		@board.each do |row|
			row.each do |cell|
				cell.nil? ? print("-") : print(cell.to_s)
			end
		puts
		end
		puts
		monkey_around
	end
	def monkey_around
		@board=@board[array[0][0],array[1,0],array[2,0],array[3,0],array[4,0],array[5,0]],
			[array[0][1],array[1,1],array[2,1],array[3,1],array[4,1],array[5,1]],
			[array[0][2],array[1,2],array[2,2],array[3,2],array[4,2],array[5,2]],
			[array[0][3],array[1,3],array[2,3],array[3,3],array[4,3],array[5,3]],
			[array[0][4],array[1,4],array[2,4],array[3,4],array[4,4],array[5,4]],
			[array[0][5],array[1,5],array[2,5],array[3,5],array[4,5],array[5,5]]
	end

	def add_piece(column,symbol)
		@column=column
		if column_avaliable?
			@board[column].push(symbol)
			@rowcoordinate=@board[column].size-1
			@counter+=1
			true
		else
			false
		end
	end

	def column_avaliable?(column)
		if @board[column].size <6 
			return true
		else 
			return false
		end
	end

	def winning_combination(symbol)
		winning_vertical
		#winning_diagonal? || winning_vertical? || winning horizontal?
	end

	def winning_vertical
		coordinate=[@column,@rowcoordinate]
		verticalarray=[@board[column][@rowcoordinate],@board[column][@rowcoordinate+1],@board[column][@rowcoordinate+2],@board[column][@rowcoordinate]+3]
		four_in_a_row(verticalarray)
	end

	def vertical
		@board[column]
	end

	def four_in_a_row?(arr)
		arr.join.to_s.include?("XXXX") || arr.join.to_s.include?("OOOO")
	end


end


# [[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6],[1,2,3,4,5,6][1,2,3,4,5,6]]

# newarray= [[array[0][0],array[1,0],array[2,0],array[3,0],array[4,0],array[5,0],
# 			[array[0][1],array[1,1],array[2,1],array[3,1],array[4,1],array[5,1],
# 			[array[0][2],array[1,2],array[2,2],array[3,2],array[4,2],array[5,2],
# 			[array[0][3],array[1,3],array[2,3],array[3,3],array[4,3],array[5,3],
# 			[array[0][4],array[1,4],array[2,4],array[3,4],array[4,4],array[5,4],
# 			[array[0][5],array[1,5],array[2,5],array[3,5],array[4,5],array[5,5]]