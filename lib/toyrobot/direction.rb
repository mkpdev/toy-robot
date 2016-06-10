module ToyRobot
  # Handle directions
  class Direction
    attr_accessor :direction

    def initialize(direction)
      @direction = direction
    end

    @north = Direction.new 'NORTH'
    @south = Direction.new 'SOUTH'
    @east  = Direction.new 'EAST'
    @west  = Direction.new 'WEST'

    @clockwise_directions = [@north, @east, @south, @west].freeze

    def to_s
      @direction
    end

    class << self
      attr_accessor :north, :south, :east, :west
    end

    def self.find(direction)
      @clockwise_directions.find { |d| d.direction.casecmp(direction) == 0 }
    end

    def self.left(direction)
      @clockwise_directions[(@clockwise_directions.index(direction) - 1) % 4]
    end

    def self.right(direction)
      @clockwise_directions[(@clockwise_directions.index(direction) + 1) % 4]
    end
  end
end
