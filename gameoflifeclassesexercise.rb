
class GameOfLife


	def update_grid

		newgrid = Array.new(@dimension1) { Array.new(@dimension2) { 0 } }

		(0..19).each do |i|
			(0..19).each do |j|

				find_alive_neighbors(i, j)

				if @grid[i][j] == 1 && @alives < 2
					newgrid[i][j] = 0 # dead b/c of underpop
					
				elsif @grid[i][j] == 1 && @alives > 3
					newgrid[i][j] = 0 # dead b/c of overpop
					
				elsif @grid[i][j] == 1
					newgrid[i][j] = 1 # stays alive

				elsif @grid[i][j] == 0 && @alives == 3
					newgrid[i][j] = 1 # alive b/c of regeneration		
				end

			end

		end

		@grid = newgrid


	end

	

	def find_alive_neighbors(i, j)
		
		@alives = 0

		if not_the_edge(i, j) == true

			if @grid[i + 1][j + 1] == 1 
				@alives += 1
			end

			if @grid[i + 1][j] == 1
				@alives += 1
			end

			if @grid[i + 1][j - 1] == 1 
				@alives += 1
			end

			if @grid[i][j - 1] == 1
				@alives += 1
			end

			if @grid[i - 1][j - 1] == 1
				@alives += 1
			end

			if @grid[i - 1][j] == 1
				@alives += 1
			end

			if @grid[i - 1][j + 1] == 1
				@alives += 1
			end

			if @grid[i][j + 1] == 1
				@alives += 1
			end
				return @alives


		elsif i == @dimension1 - 1

			if @grid[@dimension1 - 1][@dimension1 - 1]

				if @grid[i][j - 1] == 1
					@alives += 1
				end

				if @grid[i - 1][j - 1] == 1
					@alives += 1
				end

				if @grid[i - 1][j] == 1
					@alives += 1
				end
					return @alives


			elsif @grid[0][@dimension1 - 1]

				if @grid[i - 1][j] == 1
					@alives += 1
				end

				if @grid[i - 1][j + 1] == 1
					@alives += 1
				end

				if @grid[i][j + 1] == 1
					@alives += 1
				end
					return @alives

			else

				if @grid[i][j - 1] == 1
					@alives += 1
				end

				if @grid[i - 1][j - 1] == 1
					@alives += 1
				end

				if @grid[i - 1][j] == 1
					@alives += 1
				end

				if @grid[i - 1][j + 1] == 1
					@alives += 1
				end

				if @grid[i][j + 1] == 1
					@alives += 1
				end
					return @alives

			end


		elsif j == @dimension1 - 1

			if @grid[i + 1][j] == 1
				@alives += 1
			end

			if @grid[i + 1][j - 1] == 1 
				@alives += 1
			end

			if @grid[i][j - 1] == 1
				@alives += 1
			end

			if @grid[i - 1][j - 1] == 1
				@alives += 1
			end

			if @grid[i - 1][j] == 1
				@alives += 1
			end
				return @alives


		elsif i == 0

			if @grid[@dimension1 - 1][0]

				if @grid[i + 1][j] == 1
					@alives += 1
				end

				if @grid[i + 1][j - 1] == 1 
					@alives += 1
				end

				if @grid[i][j - 1] == 1
					@alives += 1
				end
					return @alives


			elsif @grid[0][0]

				if @grid[i + 1][j + 1] == 1 
					@alives += 1
				end

				if @grid[i + 1][j] == 1
					@alives += 1
				end

				if @grid[i][j + 1] == 1
					@alives += 1
				end
					return @alives

			else 
				
				if @grid[i + 1][j + 1] == 1 
					@alives += 1
				end

				if @grid[i + 1][j] == 1
					@alives += 1
				end

				if @grid[i + 1][j - 1] == 1 
					@alives += 1
				end

				if @grid[i][j - 1] == 1
					@alives += 1
				end

				if @grid[i][j + 1] == 1
					@alives += 1
				end
					return @alives

			end

		elsif j == 0

			if @grid[i + 1][j + 1] == 1 
				@alives += 1
			end

			if @grid[i + 1][j] == 1
				@alives += 1
			end

			if @grid[i - 1][j] == 1
				@alives += 1
			end

			if @grid[i - 1][j + 1] == 1
				@alives += 1
			end

			if @grid[i][j + 1] == 1
				@alives += 1
			end
				return @alives

		end
	
	end
	


	def not_the_edge(i, j)

		return (i + 1 < @dimension1 - 1 && j + 1 < @dimension2 - 1 && i - 1 > 0 && j - 1 > 0)

	
	end



	def display_grid1

		(0..19).each do |i|
			(0..19).each do |j|

				if @grid[i][j] == 0 # dead
					print "   " 
				end
				if @grid[i][j] == 1 # alive
					print " v "
				end
			end
			puts
		end
	end



	def original_mark_up(i, j)
		@grid[i][j] = 1 # alive
	end



	def set_grid_size(dimension1, dimension2)
		@dimension1 = dimension1
		@dimension2 = dimension2
		@grid = Array.new(dimension1) { Array.new(dimension2) { 0 } }
	end

end

gamenight = GameOfLife.new
gamenight.set_grid_size(50, 50)


gamenight.original_mark_up 11,19 # set to alive
gamenight.original_mark_up 11,20
gamenight.original_mark_up 12,18
gamenight.original_mark_up 12,22
gamenight.original_mark_up 13,17
gamenight.original_mark_up 13,23
gamenight.original_mark_up 13,31
gamenight.original_mark_up 14,7
gamenight.original_mark_up 14,8
gamenight.original_mark_up 14,17
gamenight.original_mark_up 14,21
gamenight.original_mark_up 14,23
gamenight.original_mark_up 14,24
gamenight.original_mark_up 14,29
gamenight.original_mark_up 15,7
gamenight.original_mark_up 15,8
gamenight.original_mark_up 15,17
gamenight.original_mark_up 15,23
gamenight.original_mark_up 15,27
gamenight.original_mark_up 15,28
gamenight.original_mark_up 16,18
gamenight.original_mark_up 16,22
gamenight.original_mark_up 16,27
gamenight.original_mark_up 16,28
gamenight.original_mark_up 16,41
gamenight.original_mark_up 16,42
gamenight.original_mark_up 17,19
gamenight.original_mark_up 17,20
gamenight.original_mark_up 17,27
gamenight.original_mark_up 17,28
gamenight.original_mark_up 17,41
gamenight.original_mark_up 17,42
gamenight.original_mark_up 18,29
gamenight.original_mark_up 18,31
gamenight.original_mark_up 19,31


looping = true
while (looping)

gamenight.display_grid1 # prints first version of board
sleep (0.5)
puts "\e[H\e[2J"
gamenight.update_grid # updating grid 

end


