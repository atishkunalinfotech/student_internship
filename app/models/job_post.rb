class JobPost < ActiveRecord::Base
	belongs_to :job
	belongs_to :company

	def self.applied_post(job_id,student_id)
		StudentJobInterest.where('student_id = ? and job_id= ? and company_id = ?',student_id, job_id.job_id, job_id.company_id)
	end
end
