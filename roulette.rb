require_relative 'player'

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

	
	def initialize(first)
		@player = first
		# if they lose do this.. @player.wallet.withdraw
		# if they win do this.. @player.wallet.deposit
		@roulette = [1..36]
		@color = ["red", "black"] 
		@oddEven = nil
		@redorblack = nil
		roulettegame
	end

	def roulettegame
		puts "Welcome to Roulette!"
		puts "Would you like to: "
		puts "1) Bet on an even or odd number"
		puts "2) Bet on a specific number"
			num1 = gets.chomp.to_i
			case num1
			when 1
				oddoreven
			when 2
				specificNumber
			end
		end

		def specificNumber
			puts "What number would you like to select (1 - 36)"
			spec = gets.to_i
			colorboi
		end

		def oddoreven
					puts "Odd or even?"
					oore = gets.strip.downcase
			case oore
				when "odd"
					@oddEven = 'odd'
				when "even"
					@oddEven = 'even'
				else
					puts "Invalid input"
					oddoreven
				end
		binding.pry

				colorboi
		end

		def colorboi
			"Would you like to bet on a color as well (y/n)"
			col = gets.strip
			case col
				if = "y"
					colorboitoo
				else 
					roll
				end

		end

		def colorboitoo
			
			

		def roll
			puts "Table spinning..." #time this so that it goes right into
			#dont sample.rand roulettegame(that's a method!), instead sample.rand roulette, the odd/even, and the color
				@roulette.sample.rand 
				@color.sample.rand 

		end

end

Roulette.new