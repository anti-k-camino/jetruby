class AddUniqueIndexNameCourseToDishes < ActiveRecord::Migration[5.0]
  def change
    remove_index :dishes, [:name, :course]
    add_index :dishes, [:name, :course], unique: true
  end
end
