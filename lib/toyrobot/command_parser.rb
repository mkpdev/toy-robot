module ToyRobot
  # Parsing each command
  class CommandParser
    include ToyRobot::Logging

    NUMBER_REG = /^\d+$/

    def initialize(allowed_commands)
      @allowed_commands = allowed_commands
    end

    def parse(command)
      args = command.split ' '
      method = args.delete_at(0).to_sym
      if valid?(method, args)
        update_args! method, args
        yield method, args
        return true
      else
        logger.warn("Parsing failed. Invalid #{command}")
        return false
      end
    end

    private

    def update_args!(method, args)
      @allowed_commands[method][0].each_with_index do |arg_type, i|
        case arg_type
        when :number
          args[i] = args[i].to_i
        when :string
        end
      end
    end

    def valid?(command, args)
      return false unless @allowed_commands.key? command
      return false unless @allowed_commands[command][0].size == args.size
      @allowed_commands[command][0].each_with_index do |arg_type, i|
        return false unless validate_arg(
          args[i], arg_type, @allowed_commands[command][1][i]
        )
      end
      true
    end

    def validate_arg(arg, arg_type, allowed_reg)
      case arg_type
      when :number
        (arg =~ NUMBER_REG) == 0
      when :string
        (arg =~ /#{allowed_reg}/) == 0
      end
    end
  end
end
