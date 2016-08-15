class AddCompositeIndexNameCourseOnDish < ActiveRecord::Migration[5.0]
  def change
    add_index :dishes, [:name, :course]
  end
end
