# frozen_string_literal: true

RSpec.describe PutCoinsToTheStorageService do
  let(:coins) { { 500 => 1, 200 => 2, 100 => 3, 50 => 4, 25 => 5 } }

  subject { described_class.new coins }

  describe '#execute' do
    before { Coin.instance_variable_set :@all, 500 => 5, 200 => 5, 100 => 5, 50 => 5, 25 => 5 }

    before { subject.execute }

    it { expect(Coin.all).to eq 500 => 6, 200 => 7, 100 => 8, 50 => 9, 25 => 10 }
  end

  describe '.execute' do
    after { described_class.execute :coins }

    it do
      #
      # described_class.new(:coins).execute
      #
      expect(described_class).to receive(:new).with(:coins) do
        double.tap { |a| expect(a).to receive(:execute) }
      end
    end
  end
end
