class RemoveDrinkFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :drink, :string
  end
end
