class BotSavesPrincess2::Bot
  attr_accessor :state

  RIGHT = "RIGHT"
  LEFT = "LEFT"
  UP = "UP"
  DOWN = "DOWN"

  BOT_CHAR = "m"
  PRINCESS_CHAR = "p"

  class Position < Struct.new(:x, :y)
  end
  
  def next_move
    if vector.x > 0
      RIGHT
    elsif vector.x < 0
      LEFT
    elsif vector.y > 0
      UP
    elsif vector.y < 0
      DOWN
    end
  end

  def princess_pos
    @princess ||= get_position(Regexp.new(PRINCESS_CHAR))
  end

  def position
    @position ||= get_position(Regexp.new(BOT_CHAR))
  end

  

  private
  def vector
    @vector ||= Position.new(princess_pos.x - position.x,
                             princess_pos.y - position.y)
  end

  def get_position(matcher)
    state.each_with_index do |data, y|
      if x = matcher =~ data
        return Position.new(x, y)
      end
    end
  end
end
