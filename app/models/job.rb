class Job < ActiveRecord::Base
	belongs_to :job_group
	belongs_to :company
	has_many :job_posts, :dependent => :destroy
	has_many :student_job_interests , :dependent => :destroy
end
