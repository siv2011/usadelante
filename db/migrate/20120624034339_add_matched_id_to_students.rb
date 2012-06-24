class AddMatchedIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :matched_id, :integer
  end
end
