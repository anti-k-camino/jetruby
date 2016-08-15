class AddIndexMenuIdOnDish < ActiveRecord::Migration[5.0]
  def change
    add_index :dishes, :menu_id
  end
end
