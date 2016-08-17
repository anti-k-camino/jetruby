class RemoveMainCourseFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :main_course, :string
  end
end
