class AddCourseIdToFinish < ActiveRecord::Migration[5.2]
  def change
    add_column :finishes, :course_id, :integer
  end
end
