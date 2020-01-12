# frozen_string_literal: true

RSpec.describe Coin do
  subject { described_class }

  its(:database) { should eq 'db/coins.yml' }

  describe '.available' do
    before { subject.instance_variable_set :@all, 500 => 0, 200 => 1, 100 => 2, 50 => 3, 25 => 4 }

    its(:available) { should eq 200 => 1, 100 => 2, 50 => 3, 25 => 4 }
  end

  describe '.push' do
    context do
      before { subject.instance_variable_set :@all, 500 => 1 }

      before { subject.push 500 }

      its(:all) { should eq 500 => 2 }
    end

    context do
      before { subject.instance_variable_set :@all, 500 => 1, 400 => 1 }

      before { subject.push 500 }

      its(:all) { should eq 500 => 2, 400 => 1 }
    end

    context do
      before { subject.instance_variable_set :@all, 500 => 1 }

      before { subject.push 499 }

      its(:all) { should eq 500 => 1 }
    end
  end

  describe '.pop' do
    context do
      before { subject.instance_variable_set :@all, 500 => 1 }

      before { subject.pop 500 }

      its(:all) { should eq 500 => 0 }
    end

    context do
      before { subject.instance_variable_set :@all, 500 => 2 }

      before { subject.pop 500 }

      its(:all) { should eq 500 => 1 }
    end

    context do
      before { subject.instance_variable_set :@all, 500 => 1 }

      before { subject.pop 499 }

      its(:all) { should eq 500 => 1 }
    end

    context do
      before { subject.instance_variable_set :@all, 500 => 0 }

      before { subject.pop 500 }

      its(:all) { should eq 500 => 0 }
    end
  end

  describe '.sum' do
    before { subject.instance_variable_set :@all, 500 => 5, 200 => 2, 100 => 1, 50 => 0, 25 => 1 }

    it { expect(subject.sum(5000)).to eq 3025 }

    it { expect(subject.sum(100)).to eq 125 }
  end

  describe '#sufficient?' do
    before { subject.instance_variable_set :@all, 500 => 5, 200 => 5, 100 => 5, 50 => 5, 25 => 5 }

    it { expect(described_class.sufficient?(4375)).to eq true }

    it { expect(described_class.sufficient?(4400)).to eq false }
  end
end
