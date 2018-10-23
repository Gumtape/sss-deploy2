class AddCourseIdToPrize < ActiveRecord::Migration[5.2]
  def change
    add_column :prizes, :course_id, :integer
  end
end
