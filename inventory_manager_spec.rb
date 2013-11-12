require 'rspec'
require 'inventory_manager'

describe InventoryManager do

  describe '#update_item' do
    it "instructs its updater to update its item's quality and age" do
      dummy_item = double
      mock_item_updater = double

      inventory_manager = InventoryManager.new(dummy_item)
      inventory_manager.stub(:item_updater).and_return(mock_item_updater)

      mock_item_updater.should_receive(:update_quality)
      mock_item_updater.should_receive(:age)
      mock_item_updater.should_receive(:check_expiry)

      inventory_manager.update_item
    end
  end
end
