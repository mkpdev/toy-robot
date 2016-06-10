module ToyRobot
  # Simulator for the toy robot board and movements
  class Simulator
    include ToyRobot::Logging
    attr_accessor :toy_robot

    def initialize(max_x, max_y)
      commands = {
        PLACE: [[:number, :number, :string],
                [nil, nil, '^NORTH$|^SOUTH$|^EAST$|^WEST$']],
        MOVE: [[], []], LEFT: [[], []],
        RIGHT: [[], []], REPORT: [[], []]
      }
      @command_parser = CommandParser.new(commands)
      @table          = Table.new max_x, max_y
      @toy_robot      = Robot.new
      logger.info 'Simulator created successfully.'
    end

    def execute(input)
      @command_parser.parse(input) do |command, args|
        logger.debug("#{command.downcase} - args #{args}")
        send(command.downcase, * args) if valid?(command)
      end
      logger.debug(@toy_robot.to_s)
    end

    def place(x, y, face)
      return unless @table.inside?(x, y)
      @toy_robot.place(x, y, face)
    end

    def move
      next_position = @toy_robot.move
      if @table.inside? next_position.x, next_position.y
        @toy_robot.position = next_position
      else
        ignore
      end
    end

    def left
      @toy_robot.left
    end

    def right
      @toy_robot.right
    end

    def report
      if @toy_robot.placed
        puts @toy_robot.to_s
      else
        puts 'Robot is not placed yet. \
              Please use PLACE command to place the robot.'
      end
    end

    private

    def ignore
      logger.debug "Ignored step towards #{toy_robot.position.direction}"
    end

    def valid?(command)
      @toy_robot.placed || (command.casecmp(:place) == 0)
    end
  end
end
