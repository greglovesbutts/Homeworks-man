# require "deck"
class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    self.cards.each do |card|
      begin
      points += card.blackjack_value
      rescue RuntimeError
        if (points + 11) > 21
          points += 1
        else
          points += 11
        end
      end
    end
    points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    new_card = deck.take(1)
    self.cards << new_card[0]
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?

    case self.points <=> other_hand.points
    when 1
      true
    when 0
      false
    when -1
      false
    end
    # other_hand.busted? || (self.points > other_hand.points)
  end

  def return_cards(deck)
    deck.return(self.cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
