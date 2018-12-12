require "byebug"
class Pile
  def initialize(cards)
    @cards = cards
  end

  # return the top (last) card and remove it from pile
  def take_card
    raise OutOfCardsError if empty?
    @cards.pop
  end

  # returns true if the pile is empty
  def empty?
    @cards.empty?
  end

  # add cards to the bottom (beginning) of pile
  def add_cards(new_cards)
    #checked if new_cards was one card or an array, then sorted if it was
    if new_cards.class == Array
      new_cards = new_cards.sort_by {|card| card.value}
      new_cards.each { |card| @cards.unshift(card) }
    else
      @cards.unshift(new_cards)
    end
  end
end

class OutOfCardsError < StandardError
end
