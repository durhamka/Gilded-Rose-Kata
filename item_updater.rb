class ItemUpdater
  attr_reader :item

  def self.maximum_quality
    50
  end

  def self.minimum_quality
    0
  end

  def initialize(item)
    @item = item
  end

  def update_quality
    raise NotImplementedError, abstract_method_error(__method__)
  end

  def expire
  end

  def age
    item.sell_in -= 1
  end

  def check_expiry
    if expired?
      expire
    end
  end

   private

  def abstract_method_error(method)
    "#{method} must be implemented in your own subclass, young grasshopper"
  end

  def expired?
    item.sell_in < 0
  end

  def maximum_quality
    self.class.maximum_quality
  end

  def minimum_quality
    self.class.minimum_quality
  end

end
