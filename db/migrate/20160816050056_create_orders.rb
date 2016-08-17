class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :main_course
      t.string :second_course
      t.string :drink
      t.string :day
      t.float :price
      t.timestamps
    end
  end
end
