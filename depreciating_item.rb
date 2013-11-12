require 'item_updater'

class DepreciatingItem < ItemUpdater

  def update_quality
    depreciate
  end

  private

  def depreciation_rate
    1
  end

  def can_depreciate?
    item.quality > minimum_quality
  end

  def depreciate
    if can_depreciate?
      item.quality -= depreciation_rate
    end
  end

  def expire
    depreciate
  end
end
