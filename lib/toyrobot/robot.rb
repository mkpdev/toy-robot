module ToyRobot
  # Robot's state class
  class Robot
    include ToyRobot::Logging
    attr_accessor :position, :placed
    def initialize
      @position  = nil
      @placed    = false
      logger.info 'Robot created successfully.'
    end

    def place(x, y, face)
      @position = Position.new(x, y, Direction.find(face))
      @placed = true
    end

    def move
      @position.move
    end

    def left
      @position.left
    end

    def right
      @position.right
    end

    def to_s
      if @placed
        "Placed at #{@position}"
      else
        'Not placed'
      end
    end
  end
end
