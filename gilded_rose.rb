class InventoryManager
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_item
    appreciate
    depreciate

    if event?
      if approaching_event_date?
        appreciate
      end
      if event_date_imminent?
        appreciate
      end
    end

    unless legendary?
      age
    end

    if expired?
      if event?
        make_worthless
      else
        appreciate
        depreciate
      end
    end
  end

  private

  def expired?
    item.sell_in < 0
  end

  def make_worthless
    item.quality = 0
  end

  def event_date_imminent?
     item.sell_in < 6
  end

  def approaching_event_date?
     item.sell_in < 11
  end

  def appreciating_item?
    item.name == 'Aged Brie' || event?
  end

  def depreciating_item?
    !appreciating_item? && !legendary?
  end

  def can_appreciate?
    appreciating_item? && item.quality < 50
  end

  def can_depreciate?
    depreciating_item? && item.quality > 0
  end

  def appreciate
    if can_appreciate?
      item.quality += 1
    end
  end

  def depreciate
    if can_depreciate?
      item.quality -= 1
    end
  end

  def legendary?
    item.name == 'Sulfuras, Hand of Ragnaros'
  end

  def age
    item.sell_in -= 1
  end

  def event?
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

end

def update_quality(items)
  items.each do |item|
    inventory_manager = InventoryManager.new(item)
    inventory_manager.update_item
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

