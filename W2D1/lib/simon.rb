class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    self.take_turn until self.game_over
    self.game_over_message
    self.reset_game
  end

  def take_turn
    unless self.game_over
      self.show_sequence
      self.require_sequence
      self.round_success_message
      self.sequence_length += 1 
    end
  end

  def show_sequence
    self.add_random_color
    self.seq
  end

  def require_sequence
    puts "need that sequence bro"
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "You did it homie, next round now"
  end

  def game_over_message
    puts "You suck. You lost, which means you're terrible"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end
