# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.
require './about_dice_project'
#require './about_scoring_project'

IN_GAME_POINTS = 300
DICE_USED_IN_GAME = 5
END_GAME_AFTER_ACHIEVING_POINTS = 3000


class Player
	attr_accessor :id_of_player, :name, :roll_score, :turn_score, :total_score
	def initialize(identifier,p_name)
		@id_of_player = identifier
		@name = p_name 
		@total_score = 0
	end
	
	def can_start_game
		puts "value of #{name} have total score #{total_score} with roll score  ====== #{@roll_score}"
		@roll_score >= IN_GAME_POINTS
	end
	
	def take_turn
		dice = DiceSet.new
		dice.roll(DICE_USED_IN_GAME)
		@roll_score = dice.score(dice.values)
		puts "value for first score is : #{@roll_score}"
		if @roll_score > 0
			compute_roll_score_for_remaining_dices(dice)	
		end
		puts "your total score is #{@total_score}"
	end

	def compute_roll_score_for_remaining_dices (dice)
		if take_user_choice(dice)  
			dice.roll(dice.non_scoring_dice)
			new_score = dice.score(dice.values)
 			@roll_score	+= new_score
			puts "your turn score is ****************** #{@roll_score}"	
			if new_score == 0
				@roll_score = 0
			else
				compute_roll_score_for_remaining_dices(dice)
			end
		else
			unless can_start_game
				@roll_score = 0 	
			end 
			@total_score += @roll_score
		end
	end

	def take_user_choice(dice)
		if(dice.non_scoring_dice != 0)
			puts "You are left with #{dice.non_scoring_dice}.would you like to continue roll?(y/n)"
			user_choice = gets.chomp
			user_choice.downcase == 'y'
		end
	end

	def compute_total_turn_score 
		if can_start_game
			@turn_score += roll_score
		end
	end
	def should_finish?
		@total_score >= END_GAME_AFTER_ACHIEVING_POINTS
	end
end

class Game
	attr_accessor :number_of_player, :players_list, :game_rounds, :is_last_round

	def take_number_of_players
		puts "please enter number of player in game"
		@number_of_player = gets.chomp
		@players_list = []
	end

	def take_name_of_players
		puts "please enter all the players name by enter: "
		@number_of_player.to_i.times do |i|
			@players_list << Player.new(i,gets.chomp)
		end
	end

	def start_playing_rounds
		@players_list.each do |player|
			puts "value of player #{player}"
			player.take_turn				
			if player.should_finish? && !is_last_round
			 	 # IF AND ONLY IF NOT LAST ROUNT 
				@is_last_round = true
				puts "last round enabled *************** $$$$$$$$$$$$$$$$$$$$$$"
				start_playing_rounds #last round
				break
			end 
		end

		unless is_last_round
			start_playing_rounds	
		end
	end	

	def display_winner
		winner  = @players_list.max_by(&:total_score)
		puts "winner of game is #{winner.name}"
	end

	def start_game
		take_number_of_players
		take_name_of_players
		start_playing_rounds
		display_winner
	end
end

game = Game.new
game.start_game
