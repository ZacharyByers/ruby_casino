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
		@bet = 10.0
		@roulette = (1..36).to_a
		@color = ["red", "black"] 
		@oddEven = nil
		@redorblack = nil
		roulettegame
	end

	def roulettegame
		puts "Welcome to Roulette!"
		puts "$10 a game"
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
			@spec = gets.to_i
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

			colorboi
		end

		def colorboi
			puts "Would you like to bet on a color as well (y/n)"
			col = gets.strip
			case col
				when "y"
					colorboitoo
				when "n"
					roll
				else
					puts "Invalid input"
					colorboi
				end
		end

		def colorboitoo
			puts "What color (red or black)"
				@colr = gets.strip
			case @colr
			when "red"
				@redorblack = 'red'
			when "black"
				@redorblack = 'black'
			else
				puts "Invalid input"
				colorboitoo
			end
			colorbet
		end

		def colorbet
			puts "How much would you like to bet on color?"
			puts "$2-5"
			@colorboibet = gets.to_f
			roll
		end
			

		def roll
			puts "Table spinning..." #time this so that it goes right into
			#dont sample.rand roulettegame(that's a method!), instead sample.rand roulette, the odd/even, and the color
				num_result = @roulette.sample
				col_result = @color.sample

				puts "It's a #{col_result} #{num_result}!" 

				#colorboibet + $10
				#either take away or add, depending on bet
				#compare the randomized answer to the bet placed
				#add or take amount from wallet in main bet
				#add or take amount from wallet in color bet (if they placed a bet there)
				if num_result == @spec
					'say congradimication you won'
					@player.wallet.deposit(@bet) 
				else 
					puts "Oopsie poopsies, you silly loser!"
					@player.wallet.withdraw(@bet)

				  #win
				#elsif 
				  # check if num is even or odd check user input for even or odd see if they match
				#elsif
				   #col_result && @redorblack
				end
				if col_result == @colr
					"!!!You got something right!!!"
					@player.wallet.deposit(@colorboibet)
				else
					puts "Uh oh spagghetti-os, couldn't even get the color!"
					@player.wallet.withdraw(@colorboibet)
				end


		end

end

#player = Player.new
#Roulette.new(player)