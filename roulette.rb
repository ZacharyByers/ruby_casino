require 'pry'
require 'colorize'
class Roulette

	# set number array
	# red or black array
	# ask user to place min or max amount on odd or even
	# or if they want to bet on a specific number
	# ask if they want to bet a little more for a color (optional: they write yes or no then bet if yes)
	# have it roll the table (timed)
	# display randomized number/color
	# either add or take away from wallet amount depending on the bet

	@roulette = [1..36]
	@color = ["red", "black"]

	def roulettegame
		puts "Welcome to Roulette!"
		puts "Would you like to: "
		puts "1) Bet on an even or odd number"
		puts "2) Bet on a specific number"
			num1 = gets.to_f
			case num1
			when num1 == 1
				oddoreven
			when num1 == 2
				specificNumber
			end
		end

		def specificNumber
			puts "What number would you like to select (1 - 36)"
			spec = gets.to_f
			colorboi
		end

		def oddoreven
					puts "Odd or even?"
					@oore = gets.strip.to_s
		end

		def oddoreventoo
			case oore
				when oore = "odd"
					@roulette/2 % 1
				when oore = "even"
					@roulette/2 % 0
				else
					puts "Invalid input"
					roulettegame
		end

		def colorboi
			

		def roll
			puts "Table spinning..." #time this so that it goes right into
				@roulettegame.sample.rand 



binding.pry