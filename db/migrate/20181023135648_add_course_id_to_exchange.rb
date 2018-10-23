class AddCourseIdToExchange < ActiveRecord::Migration[5.2]
  def change
    add_column :exchanges, :course_id, :integer
  end
end
