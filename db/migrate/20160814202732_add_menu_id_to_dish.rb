class AddMenuIdToDish < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :menu_id, :integer, index: true
  end
end
