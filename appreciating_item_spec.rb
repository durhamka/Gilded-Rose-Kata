require 'rspec'
require 'appreciating_item'
require 'item'

describe AppreciatingItem do

  describe '#update_quality' do
    it 'increments the item quality' do
      initial_quality = 0

      item = Item.new('Item name', 5, initial_quality)
      appreciating_item = AppreciatingItem.new(item)

      appreciating_item.update_quality
      expect(item.quality).to eq(1)
    end

    context 'when item is at max quality' do
      it 'does not increment the item quality' do
        initial_quality = ItemUpdater.maximum_quality

        item = Item.new('Item name', 3, initial_quality)
        appreciating_item = AppreciatingItem.new(item)

        appreciating_item.update_quality
        expect(item.quality).to eq(initial_quality)
      end
    end
  end

  describe '#age' do
    it 'decrements the item sell_in value' do
      sell_in = 5

      item = Item.new('Item name', sell_in, 10)
      appreciating_item = AppreciatingItem.new(item)

      appreciating_item.age
      expect(item.sell_in).to eq(4)
    end
  end

  describe '#check_expiry' do
    context 'when the item is expired' do
      it 'increments the item quality' do
        initial_quality = 2
        sell_in = -1

        item = Item.new('Item name', sell_in, initial_quality)
        appreciating_item = AppreciatingItem.new(item)

        appreciating_item.check_expiry
        expect(item.quality).to eq(3)
      end
    end

    context 'when the item is not expired' do
      it 'does not increment the item quality' do
        initial_quality = 2
        sell_in = 1

        item = Item.new('Item name', sell_in, initial_quality)
        appreciating_item = AppreciatingItem.new(item)

        appreciating_item.check_expiry
        expect(item.quality).to eq(2)
      end
    end
  end
end

