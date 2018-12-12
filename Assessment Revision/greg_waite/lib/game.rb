require_relative './ai_player'

class Game
  # ::deal_in_players is a factory method that:
  # 1) Takes in an array of cards
  # 2) deals cards in an alternating pattern & creates 2 AIPlayers
  # 3) return instance of Game
  def self.deal_in_players(deck)
    player1_cards = []
    player2_cards = []
    deck.each do |card|
      player2_cards << deck.shift
      player1_cards << deck.shift
    end
    Game.new(AIPlayer.new(player1_cards), AIPlayer.new(player2_cards))
  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  # call do_battle until game is over
  def play
    #filled this in
    until game_over?
      do_battle
    end
  end

  # 1. Players each take their top card
  # 2. If the cards' rank is the same, first, take an additional card
  #    prisoner from each player. Then, repeat #do_battle. 
  # 3. If the last drawn cards are different ranks, all the cards drawn in
  #    this round are awarded to the drawer of the higher ranked card.
  def do_battle(prisoners = [])
    return if game_over?
    prisoners = prisoners
    card1 = @player1.take_card
    card2 = @player2.take_card
    case card1 <=> card2
    when -1
      @player2.give_won_cards([card1, card2] + prisoners)
    when 1
      @player1.give_won_cards([card1, card2] + prisoners)
    when 0
      unless game_over?
      card3 = @player1.take_card
      card4 = @player2.take_card
      do_battle([card1, card2, card3, card4] + prisoners)
      end
    end

  end

  # if either of the players has run out of cards, the game is over
  def game_over?
    @player1.out_of_cards? || @player2.out_of_cards?
  end
end
