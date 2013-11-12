require 'appreciating_item'

class EventItem < AppreciatingItem
  attr_reader :item

  def appreciation_rate
    if imminent?
      3
    elsif approaching?
      2
    else
      1
    end
  end

  private

  def expire
    make_worthless
  end

  def approaching?
    item.sell_in < 11
  end

  def imminent?
    item.sell_in < 6
  end

  def make_worthless
    item.quality = minimum_quality
  end
end
