class StudentCity < ActiveRecord::Base
	belongs_to :country
	has_many :student_degrees
	has_many :students
end
