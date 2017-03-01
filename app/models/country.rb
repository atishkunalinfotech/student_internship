class Country < ActiveRecord::Base
	has_many :students
	has_many :student_universities
	has_many :student_degrees
	has_many :student_cities
	has_many :student_certifications
end
