require_relative '../spec_helper'
include ToyRobot

describe Position do
  context '#moves correctly to north' do
    before do
      @position = Position.new(2, 3, Direction.north)
      @curr_position = @position.move
    end

    it { expect(@curr_position.x).to be 2 }
    it { expect(@curr_position.y).to be 4 }
    it { expect(@curr_position.direction).to be Direction.north }
  end

  context '#moves correctly to south' do
    before do
      @position = Position.new(2, 3, Direction.south)
      @curr_position = @position.move
    end

    it { expect(@curr_position.x).to be 2 }
    it { expect(@curr_position.y).to be 2 }
    it { expect(@curr_position.direction).to be Direction.south }
  end

  context '#moves correctly to east' do
    before do
      @position = Position.new(2, 3, Direction.east)
      @curr_position = @position.move
    end

    it { expect(@curr_position.x).to be 3 }
    it { expect(@curr_position.y).to be 3 }
    it { expect(@curr_position.direction).to be Direction.east }
  end

  context '#moves correctly to west' do
    before do
      @position = Position.new(2, 3, Direction.west)
      @curr_position = @position.move
    end

    it { expect(@curr_position.x).to be 1 }
    it { expect(@curr_position.y).to be 3 }
    it { expect(@curr_position.direction).to be Direction.west }
  end

  context '#turns left' do
    before do
      @start_position = Position.new(2, 3, Direction.west)
      @start_position.left
    end

    it { expect(@start_position.x).to be 2 }
    it { expect(@start_position.y).to be 3 }
    it { expect(@start_position.direction).to be Direction.south }
  end

  context '#turns right' do
    before do
      @start_position = Position.new(2, 3, Direction.west)
      @start_position.right
    end

    it { expect(@start_position.x).to be 2 }
    it { expect(@start_position.y).to be 3 }
    it { expect(@start_position.direction).to be Direction.north }
  end
end
