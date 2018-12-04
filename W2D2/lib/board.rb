class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    self.place_stones
  #   four_stones = [:stone, :stone, :stone, :stone]

  #   @cups[1..5] = @cups[0..5].map{|space| four_stones }
  #   @cups[7..12] = @cups[7..12].map{|space| four_stones }
  end

  def place_stones
    self.cups.each.with_index do |cup, i|
      next if i == 6 || i == 13
        4.times { cup << :stone }
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13
      raise "Invalid starting cup"
    elsif self.cups[start_pos].empty?
      raise "Starting cup is empty"
    end

  end

  def make_move(start_pos, current_player_name)
    stones = self.cups[start_pos].length  
    self.cups[start_pos] = []
    i = start_pos + 1
    while stones > 0
      if current_player_name == self.name1
        i = 0 if i == 13
      elsif current_player_name == self.name2
        i += 1 if i == 6
        i = 0 if i == 14
      end
      self.cups[i] << :stone
      stones -= 1
      i += 1
    end  
    self.render
    self.next_turn(i - 1)
    # if self.valid_move?(start_pos)
      
    # end 
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      :prompt
    elsif self.cups[ending_cup_idx].count == 1
      :switch
    else 
      ending_cup_idx 
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0..5].all?{|cup| cup.empty?} || self.cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    if self.cups[6].length == self.cups[13].length
      :draw
    elsif self.cups[6].length > self.cups[13].length
      self.name1
    elsif self.cups[6].length < self.cups[13].length
      self.name2
    end
      
  end

end

# board = Board.new("Greg", "Greg1")
# p board.name1
# p board.cups
# p board.make_move(1, "Greg")
# puts "________"
# p board.cups

