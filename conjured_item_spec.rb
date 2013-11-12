require 'rspec'
require 'conjured_item'
require 'item'

describe ConjuredItem do

  describe '#update_quality' do
    context 'when the item has not yet expired' do
      it 'decrements the item quality twice as fast' do
        initial_quality = 4
        sell_in = 5

        item = Item.new('Item name', sell_in, initial_quality)
        conjured_item = ConjuredItem.new(item)

        conjured_item.update_quality
        expect(item.quality).to eq(2)
      end
    end
  end

  context 'when the item is expired' do
    it 'decrements the item by another two times' do
      initial_quality = 2
      sell_in = -1

      item = Item.new('Item name', sell_in, initial_quality)
      conjured_item = ConjuredItem.new(item)

      conjured_item.check_expiry
      expect(item.quality).to eq(0)
    end
  end
end
