# frozen_string_literal: true

RSpec.describe Coin do
  subject { described_class }

  describe '.all' do
    its :all do
      should eq 500 => 5, 200 => 5, 100 => 5, 50 => 5, 25 => 5
    end

    context do
      before { subject.instance_variable_set :@all, 500 => 1 }

      its(:all) { should eq 500 => 1 }
    end
  end

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
end
