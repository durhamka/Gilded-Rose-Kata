require 'item_updater'

class AppreciatingItem < ItemUpdater
  def update_quality
    appreciate
  end

  private

  def appreciation_rate
    1
  end

  def can_appreciate?
    item.quality < maximum_quality
  end

  def appreciate
    if can_appreciate?
      item.quality += appreciation_rate
    end
  end

  def expire
    appreciate
  end
end
