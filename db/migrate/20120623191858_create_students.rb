class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :studentid
      t.string :status
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :number
      t.string :college
      t.string :state
      t.integer :yearofgraduation
      t.string :careertrack
      t.integer :exercisescompleted

      t.timestamps
    end
  end
end
