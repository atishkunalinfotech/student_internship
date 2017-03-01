class StudentDegree < ActiveRecord::Base
	belongs_to :student
	belongs_to :student_university
	belongs_to :country
	belongs_to :student_city
end
