class Student < ActiveRecord::Base
  attr_accessible :careertrack, :college, :email, :exercisescompleted, :firstname, :lastname, :number, :state, :status, :studentid, :yearofgraduation, :group
end
