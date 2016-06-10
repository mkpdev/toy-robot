require_relative '../spec_helper'
include ToyRobot

describe Simulator do
  let(:simulator) { Simulator.new 5, 5 }
  let(:north) { Direction.north }
  let(:west) { Direction.west }
  let(:east) { Direction.east }
  let(:south) { Direction.south }

  describe '#gets placed' do
    before { simulator.place 2, 3, 'NORTH' }

    it do
      expect(simulator.toy_robot.position).to be Position.new(2, 3, north)
    end
  end

  describe '#moves' do
    context 'when inside table' do
      before do
        simulator.place 2, 3, 'NORTH'
        simulator.move
      end
      it do
        expect(simulator.toy_robot.position).to be Position.new(2, 4, north)
      end
    end

    context 'when at edge of table' do
      before do
        simulator.place 4, 4, 'NORTH'
        simulator.move
      end
      it do
        expect(simulator.toy_robot.position).to be Position.new(4, 4, north)
      end
    end
  end

  describe '#turns' do
    context 'when faced north' do
      before { simulator.place 2, 2, 'NORTH' }

      it do
        simulator.left
        expect(simulator.toy_robot.position).to be Position.new(2, 2, west)
      end

      it do
        simulator.right
        expect(simulator.toy_robot.position).to be Position.new(2, 2, east)
      end
    end

    context 'when faced south' do
      before { simulator.place 2, 2, 'SOUTH' }

      it do
        simulator.left
        expect(simulator.toy_robot.position).to be Position.new(2, 2, east)
      end

      it do
        simulator.right
        expect(simulator.toy_robot.position).to be Position.new(2, 2, west)
      end
    end

    context 'when faced east' do
      before { simulator.place 2, 2, 'EAST' }

      it do
        simulator.left
        expect(simulator.toy_robot.position).to be Position.new(2, 2, north)
      end
      it do
        simulator.right
        expect(simulator.toy_robot.position).to be Position.new(2, 2, south)
      end
    end

    context 'when faced west' do
      before { simulator.place 2, 2, 'WEST' }

      it do
        simulator.left
        expect(simulator.toy_robot.position).to be Position.new(2, 2, south)
      end
      it do
        simulator.right
        expect(simulator.toy_robot.position).to be Position.new(2, 2, north)
      end
    end
  end
end
