module ToyRobot
  # Parse options and run command
  class CLI
    def initialize
      options = { file: nil, x: 5, y: 5 }
      parser = OptionParser.new do |opts|
        opts.banner = 'Usage: toyrobot [options]'
        parse_filename(opts, options)
        parse_x(opts, options)
        parse_y(opts, options)
        display_help(opts)
      end
      parser.parse!
      @application = ToyRobot::App.new(options)
    end

    def start
      @application.start
    end

    private

    def parse_filename(input_opts, app_opts)
      description = 'Filepath for input commands'
      short_description = '--file filepath'
      input_opts.on('-f', short_description, description) do |fn|
        app_opts[:file] = fn
      end
    end

    def parse_x(input_opts, app_opts)
      input_opts.on('-x', '--xcoordinate X', 'Max X co-ordinate') do |max_x|
        begin
          app_opts[:x] = Integer(max_x)
        rescue
          handle_parsing_errors('Invalid x argument')
        end
      end
    end

    def parse_y(input_opts, app_opts)
      input_opts.on('-y', '--ycoordinate Y', 'Max Y co-ordinate') do |max_y|
        begin
          app_opts[:y] = Integer(max_y)
        rescue
          puts 'Invalid y argument'
          puts input_opts
          exit
        end
      end
    end

    def display_help(input_opts)
      input_opts.on('-h', '--help', 'Displays Help') do
        puts input_opts
        exit
      end
    end

    def handle_parsing_errors(message)
      puts message
      puts app_opts
      exit
    end
  end
end
