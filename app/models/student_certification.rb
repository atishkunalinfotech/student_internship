class StudentCertification < ActiveRecord::Base
	belongs_to :student
	belongs_to :country
end
