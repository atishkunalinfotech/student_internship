class StudentUniversity < ActiveRecord::Base
	has_many :students
	has_many :student_degrees
	belongs_to :country
end
