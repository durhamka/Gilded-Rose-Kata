require 'rspec'
require 'depreciating_item'
require 'item'

describe DepreciatingItem do

  describe '#update_quality' do
    it 'decrements the item quality' do
      initial_quality = 100

      item = Item.new('Item name', 3, initial_quality)
      depreciating_item = DepreciatingItem.new(item)

      depreciating_item.update_quality
      expect(item.quality).to eq(99)
    end

    context 'when item is at minimum quality' do
      it 'does not decrement the item quality' do
        initial_quality = ItemUpdater.minimum_quality

        item = Item.new('Item name', 3, initial_quality)
        depreciating_item = DepreciatingItem.new(item)

        depreciating_item.update_quality
        expect(item.quality).to eq(initial_quality)
      end
    end
  end

  describe '#age' do
    it 'decrements the item sell_in value' do
      sell_in = 5

      item = Item.new('Item name', sell_in, 10)
      depreciating_item = DepreciatingItem.new(item)

      depreciating_item.age
      expect(item.sell_in).to eq(4)
    end
  end

  describe '#check_expiry' do
    context 'when the item is expired' do
      it 'decrements the item quality' do
        initial_quality = 2
        sell_in = -1

        item = Item.new('Item name', sell_in, initial_quality)
        depreciating_item = DepreciatingItem.new(item)

        depreciating_item.check_expiry
        expect(item.quality).to eq(1)
      end
    end

    context 'when the item is not expired' do
      it 'does not decrement the item quality' do
        initial_quality = 2
        sell_in = 1

        item = Item.new('Item name', sell_in, initial_quality)
        depreciating_item = DepreciatingItem.new(item)

        depreciating_item.check_expiry
        expect(item.quality).to eq(2)
      end
    end
  end
end
