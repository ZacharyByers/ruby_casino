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
			@num1 = gets.to_f
			oddoreven
		end

		def oddoreven
		when @num1 = 1
			puts "Odd or even?"
			@oore = gets.strip.to_s
		oddoreventoo
		end

		def oddoreventoo
		when @oore = "odd"
			#take array into odd
		when @oore = "even"
			#take array into even
		else
			puts "Invalid input"
			roulettegame
		end

		def roll
			puts "Table spinning..." #time this so that it goes right into
				@roulettegame.sample.rand 



binding.pry