# frozen_string_literal: true

RSpec.describe Product do
  let(:beer) { { 'id' => 1, 'name' => 'Beer', 'price' => 175, 'quantity' => 5 } }

  let(:chips) { { 'id' => 2, 'name' => 'Chips', 'price' => 125, 'quantity' => 5 } }

  let(:candy) { { 'id' => 3, 'name' => 'Candy', 'price' => 25, 'quantity' => 0 } }

  let(:products) { [beer, chips, candy] }

  before { described_class.instance_variable_set :@all, products }

  describe '.database' do
    subject { described_class }

    its(:database) { should eq 'db/products.yml' }
  end

  describe '.find' do
    subject { described_class.find id }

    context do
      let(:id) { 1 }

      it { should eq beer }
    end

    context do
      let(:id) { 2 }

      it { should eq chips }
    end

    context do
      let(:id) { 3 }

      it { should eq candy }
    end

    context do
      let(:id) { 99 }

      it { expect { subject }.to raise_error ProductNotFoundError }
    end
  end

  describe '.pop' do
    context do
      before { described_class.pop 1 }

      subject { described_class.find 1 }

      it { should eq 'id' => 1, 'name' => 'Beer', 'price' => 175, 'quantity' => 4 }
    end

    context do
      let(:beer) { { 'id' => 1, 'name' => 'Beer', 'price' => 175, 'quantity' => 0 } }

      before { described_class.pop 1 }

      subject { described_class.find 1 }

      it { should eq 'id' => 1, 'name' => 'Beer', 'price' => 175, 'quantity' => 0 }
    end
  end

  describe '.available' do
    subject { described_class.available }

    it { should eq [beer, chips] }
  end
end
