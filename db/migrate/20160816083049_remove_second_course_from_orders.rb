class RemoveSecondCourseFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :second_course, :string
  end
end
