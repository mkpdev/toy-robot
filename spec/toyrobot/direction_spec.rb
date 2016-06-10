require_relative '../spec_helper'
include ToyRobot

describe Direction do
  describe '::finds directions' do
    it { expect(Direction.find('NORTH')).to be Direction.north }
    it { expect(Direction.find('SOUTH')).to be Direction.south }
    it { expect(Direction.find('EAST')).to be Direction.east  }
    it { expect(Direction.find('WEST')).to be Direction.west  }
  end

  describe '::turns left' do
    it { expect(Direction.left(Direction.north)).to be Direction.west }
    it { expect(Direction.left(Direction.south)).to be Direction.east }
    it { expect(Direction.left(Direction.east)).to be Direction.north }
    it { expect(Direction.left(Direction.west)).to be Direction.south }
  end

  describe '::turns right' do
    it { expect(Direction.right(Direction.north)).to be Direction.east }
    it { expect(Direction.right(Direction.south)).to be Direction.west }
    it { expect(Direction.right(Direction.east)).to be Direction.south }
    it { expect(Direction.right(Direction.west)).to be Direction.north }
  end
end
