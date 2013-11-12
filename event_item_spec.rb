require 'rspec'
require 'event_item'
require 'item'

describe EventItem do

  describe '#update_quality' do
    context 'when the event is not approaching nor imminent' do
      it 'increments the item quality' do
        initial_quality = 0
        sell_in = 11

        item = Item.new('Item name', sell_in, initial_quality)
        event_item = EventItem.new(item)

        event_item.update_quality
        expect(item.quality).to eq(1)
      end
    end

    context 'when the event date is approaching' do
      it 'increments the item quality by 2' do
        initial_quality = 3
        sell_in = 10

        item = Item.new('Item name', sell_in, initial_quality)
        event_item = EventItem.new(item)

        event_item.update_quality
        expect(item.quality).to eq(5)
      end
    end

    context 'when the event date is imminent' do
      it 'increments the item quality by 3' do
        initial_quality = 5
        sell_in = 5

        item = Item.new('Item name', sell_in, initial_quality)
        event_item = EventItem.new(item)

        event_item.update_quality
        expect(item.quality).to eq(8)
      end
    end
  end

  describe '#age' do
    it 'decrements the item sell_in value' do
      sell_in = 5

      item = Item.new('Item name', sell_in, 10)
      event_item = EventItem.new(item)

      event_item.age
      expect(item.sell_in).to eq(4)
    end
  end

  describe '#check_expiry' do
    context 'when the item is expired' do
      it 'marks the item as worthless' do
        initial_quality = 2
        sell_in = -1

        item = Item.new('Item name', sell_in, initial_quality)
        event_item = EventItem.new(item)

        event_item.check_expiry
        expect(item.quality).to eq(0)
      end
    end
  end

end
