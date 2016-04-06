class Job < ActiveRecord::Base
	belongs_to :job_group
	has_many :job_posts
	has_many :student_job_interests
end
