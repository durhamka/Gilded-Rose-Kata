require 'depreciating_item'

class ConjuredItem < DepreciatingItem
  private

  def depreciation_rate
    2
  end
end
