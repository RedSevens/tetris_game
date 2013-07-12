require 'ruby-processing'

class Tetris < Processing::App
	def setup
    background(0, 0, 0)
	end

	def draw
		if @x.nil? && @y.nil?
			@x = 75
			@y = 0
			@tetromino_pieces = rand(7)
		elsif @y >= 475 && y <= 480
			@x = 75
			@y = 0
      @tetromino_pieces = rand(7)
		end
		gravity
		background(0, 0, 0)
		tetrominos
		if !@proc.nil?
			@proc1.call
		end
	end

	def key_pressed
		warn "#{key.inspect} was pressed" 
		if key == "a" && @tetromino_pieces == 4
			if @x >= 0
				@x -= 25
			end
		elsif key == "a" && @x > 0
			@x -= 25
		end
		if key == "d" && @x < 175
			if @tetromino_pieces == 0 && @x == 150
				@x = @x
			else
				@x += 25
			end
		end
		if key == "s"
			@y += 49.9
		end
	end

	def tetrominos
		@tetromino_pieces ||= 0
		#I Piece
		if @tetromino_pieces == 0
		@proc1 = proc {
			fill(0, 255, 255)
		  rect(@x, @y, 25, 25)
		  rect(@x+25, @y, 25, 25)
		  rect(@x+50, @y, 25, 25)
		  rect(@x+75, @y, 25, 25)
		}
		@proc1.call
		#J Piece
		elsif @tetromino_pieces == 1
			fill(0, 0, 255)
			rect(@x, @y-25, 25, 25)
		  rect(@x, @y, 25, 25)
		  rect(@x+25, @y, 25, 25)
		  rect(@x+50, @y, 25, 25)
		#T Piece
		elsif @tetromino_pieces == 2
			fill(135, 31, 120)
			rect(@x, @y,25,25)
		  rect(@x+25, @y, 25, 25)
		  rect(@x+50, @y, 25, 25)
		  rect(@x+25, @y-25, 25, 25)
		#L Piece
		elsif @tetromino_pieces == 3
			fill(255, 140, 0)
			rect(@x, @y, 25, 25)
		  rect(@x+25, @y, 25, 25)
		  rect(@x+50, @y, 25, 25)
		  rect(@x+50, @y-25, 25, 25)
		#O Piece
		elsif @tetromino_pieces == 4
			fill(255, 255, 0)
			rect(@x+25, @y-25, 25, 25)
		  rect(@x+25, @y, 25, 25)
		  rect(@x+50, @y, 25, 25)
		  rect(@x+50, @y-25, 25, 25)
		#Z Piece
		elsif @tetromino_pieces == 5
			fill(255, 0, 0)
			rect(@x, @y-25, 25, 25)
		  rect(@x+25, @y-25, 25, 25)
		  rect(@x+25, @y, 25, 25)
		  rect(@x+50, @y, 25, 25)
		#S Piece
		elsif @tetromino_pieces == 6
			fill(0, 255, 0)
			rect(@x, @y, 25, 25)
		  rect(@x+25, @y-25, 25, 25)
	    rect(@x+25, @y, 25, 25)
	    rect(@x+50, @y-25, 25, 25)
		end
		return @tetromino_pieces
	end

	def transactions

	end

	def gravity
		@gravity
		if @gravity.nil?
			@gravity = 0
		elsif @gravity == -2
			@gravity = 0
		end
		@gravity -= 1
		@y -= @gravity
		return @y
	end
end

Tetris.new(:width => 250, :height => 500,
  :title => "Tetris", :full_screen => false)