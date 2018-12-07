require_relative 'card'

# Represents a deck of playing cards.
class Deck
  
  # Returns an array of all 52 playing cards.
  def self.all_cards
    all = []
    Card.suits.each do |suit|
      Card.values.each do |val|
        all << Card.new(suit, val)
      end
    end
    all
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if cards.count - n < 0
    taken = []
    n.times do
      taken << cards.shift
    end
    taken
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    cards.each do |card|
      @cards << card
    end
  end

  # private
  # attr_reader :cards
  
end
