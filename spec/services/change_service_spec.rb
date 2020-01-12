# frozen_string_literal: true

RSpec.describe ChangeService do
  describe '#calculate' do
    before { Coin.instance_variable_set :@all, 500 => 5, 200 => 5, 100 => 5, 50 => 5, 25 => 5 }

    subject { described_class.new sum }

    context do
      let(:sum) { 300 }

      after { expect(Coin.all).to eq 500 => 5, 200 => 4, 100 => 4, 50 => 5, 25 => 5 }

      its(:calculate) { should eq 200 => 1, 100 => 1 }
    end

    context do
      let(:sum) { 1600 }

      after { expect(Coin.all).to eq 500 => 2, 200 => 5, 100 => 4, 50 => 5, 25 => 5 }

      its(:calculate) { should eq 500 => 3, 100 => 1 }
    end

    context do
      let(:sum) { 4375 }

      after { expect(Coin.all).to eq 500 => 0, 200 => 0, 100 => 0, 50 => 0, 25 => 0 }

      its(:calculate) { should eq 500 => 5, 200 => 5, 100 => 5, 50 => 5, 25 => 5 }
    end

    context do
      let(:sum) { 4400 }

      it { expect { subject.calculate }.to raise_error InsufficientCoinsError }
    end

    context do
      before { Coin.instance_variable_set :@all, 500 => 3, 200 => 2, 100 => 0, 50 => 0, 25 => 0 }

      let(:sum) { 1600 }

      it { expect { subject.calculate }.to raise_error InsufficientCoinsError }
    end
  end
end
