module ToyRobot
  # Table class to simulate board
  class Table
    include ToyRobot::Logging
    def initialize(max_x, max_y)
      @max_x = max_x
      @max_y = max_y
      logger.info "Table boundaries are #{@max_x},#{@max_y}"
    end

    def inside?(x, y)
      (0..@max_x - 1).member?(x) && (0..@max_y - 1).member?(y)
    end
  end
end
