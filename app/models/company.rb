class Company < ActiveRecord::Base
	has_many :job_posts, :dependent => :destroy
	has_many :student_job_interests, :dependent => :destroy
end
