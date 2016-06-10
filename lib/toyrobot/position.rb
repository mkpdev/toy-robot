module ToyRobot
  # Position of the toy robot
  class Position
    attr_accessor :x, :y, :direction

    def initialize(x, y, direction)
      @x = x
      @y = y
      @direction = direction
    end

    def equal?(other)
      @x == other.x &&
        @y == other.y &&
        @direction == other.direction
    end

    def move
      curr_postion = dup
      step(curr_postion)
      curr_postion
    end

    def left
      @direction = Direction.left @direction
    end

    def right
      @direction = Direction.right @direction
    end

    def to_s
      "X= #{@x} Y=#{@y} Facing=#{@direction}"
    end

    private

    def step(curr_postion)
      case curr_postion.direction
      when Direction.north
        curr_postion.y += 1
      when Direction.south
        curr_postion.y -= 1
      when Direction.east
        curr_postion.x += 1
      when Direction.west
        curr_postion.x -= 1
      end
    end
  end
end
