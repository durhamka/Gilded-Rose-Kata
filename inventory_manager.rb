require 'event_item'
require 'legendary_item'
require 'depreciating_item'
require 'appreciating_item'
require 'conjured_item'

class InventoryManager
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_item
    item_updater.update_quality
    item_updater.age
    item_updater.check_expiry
  end

  private

  def item_updater
    if legendary?
      LegendaryItem.new(item)
    elsif event?
      EventItem.new(item)
    elsif appreciating_item?
      AppreciatingItem.new(item)
    elsif conjured_item?
      ConjuredItem.new(item)
    else
      DepreciatingItem.new(item)
    end
  end

  def appreciating_item?
    item.name == 'Aged Brie'
  end

  def legendary?
    item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def event?
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def conjured_item?
    item.name == 'Conjured Mana Cake'
  end
end
