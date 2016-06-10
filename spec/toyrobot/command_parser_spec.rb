require_relative '../spec_helper'

include ToyRobot

describe CommandParser do
  subject(:command_parser) do
    CommandParser.new(
      Greet: [[:string],
              ['^Hello$|^Hi$']],
      Name: [[:string], []],
      Age: [[:number], []]
    )
  end

  context '#with valid command' do
    context 'with range' do
      before do
        @ran    = false
        @called = command_parser.parse 'Greet Hello' do |m, a|
          @ran = true
          @m = m
          @a = a
        end
      end
      it { expect(@ran).to    be true }
      it { expect(@called).to be true }
      it { expect(@a.size).to be 1    }
      it { expect(@a[0]).to  match 'Hello' }
      it { expect(@m).to     match :Greet }
    end

    context '#without range' do
      context 'with string' do
        before do
          @ran = false
          @called = command_parser.parse 'Name Tom' do |m, a|
            @ran = true
            @m = m
            @a = a
          end
        end

        it { expect(@ran).to be true    }
        it { expect(@called).to be true }
        it { expect(@a.size).to be 1    }
        it { expect(@a[0]).to  match 'Tom' }
        it { expect(@m).to     match :Name }
      end

      context 'with number' do
        before do
          @ran = false
          @called = command_parser.parse 'Age 50' do |m, a|
            @ran    = true
            @m      = m
            @a      = a
          end
        end
        it { expect(@ran).to    be true }
        it { expect(@called).to be true }
        it { expect(@a.size).to be 1    }
        it { expect(@a[0]).to   be 50   }
        it { expect(@m).to match :Age }
      end
    end
  end

  context '#with invalid command' do
    before do
      @ran = false
      @called = command_parser.parse 'Greet ' do |_m, _a|
        @ran = true
      end
    end
    it { expect(@called).to be false }
    it { expect(@called).to be false }
  end
end
