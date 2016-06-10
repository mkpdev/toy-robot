require_relative '../spec_helper'
include ToyRobot

describe Table do
  context '#checks boundry' do
    before { @t = Table.new 5, 5 }
    it { expect(@t.inside?(2, 3)).to be true }
    it { expect(@t.inside?(0, 0)).to be true }
    it { expect(@t.inside?(5, 5)).to be false }
    it { expect(@t.inside?(5, 3)).to be false }
    it { expect(@t.inside?(3, 5)).to be false }
    it { expect(@t.inside?(6, 3)).to be false }
    it { expect(@t.inside?(3, 6)).to be false }
    it { expect(@t.inside?(-1, 0)).to be false }
    it { expect(@t.inside?(0, -1)).to be false }
  end
end
