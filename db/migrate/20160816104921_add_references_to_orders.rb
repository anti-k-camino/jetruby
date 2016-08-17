class AddReferencesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :first
    add_reference :orders, :second
    add_reference :orders, :drink
  end
end
