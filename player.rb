class Player 
	def initialize(name,symbol,board)
		@name=name
		@symbol=symbol
		@board=board
	end
	attr_accessor :name, :symbol

	def get_coordinates
		while true
			column=ask_for_coordinates
			if check_for_format(column)
				if board.add_piece(column,@symbol)
					break
				end
			end
		end
	end

	def everything_valid
	end

	def ask_for_coordinates
		puts "Please enter a valid column number: "
		gets.chomp #make equal to variable if error in this line
	end

	def check_for_format(column)
		if column == (1..6)
			puts "good format"
		else
			puts "Wrong Format"
		end
	end
end





