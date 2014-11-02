class RPSGame
  attr_reader :players_move, :wins, :computer_play

  VALID_MOVES = [:rock, :paper, :scissors]

  def initialize(players_move)
    @players_move = players_move
    @wins = [[:paper, :rock], [:rock, :scissors], [:scissors, :paper]]
    @computer_play = VALID_MOVES.shuffle.first
    raise PlayTypeError unless self.class.valid_play?(players_move)
  end

  def self.valid_play?(move)
    VALID_MOVES.include?(move)
  end

  def won?
    @wins.each do |combo|
      return true if players_move == combo[0] && computer_play == combo[1]
    end
    false
  end

  def tied?
    players_move == computer_play
  end

  def lost?
    !(won? || tied?)
  end

end

class PlayTypeError < StandardError
end

