class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :educations, :dependent => :destroy
         has_many :student_work_exps,:dependent => :destroy
         has_many :semester_registereds, :dependent => :destroy
         has_many :user_skills, :dependent => :destroy
         has_many :student_job_interests, :dependent => :destroy

         accepts_nested_attributes_for :educations, :allow_destroy => true
         accepts_nested_attributes_for :student_work_exps, :allow_destroy => true
         mount_uploader :attachment, AttachmentUploader
         validates :studentid, presence: true, :uniqueness => true
         
         def self.country_name(name)
          country = ISO3166::Country[country]
          #country.translations[I18n.locale.to_s] || country.name
          #ISO3166::Country[country]
         end

         def self.myskill(params,student_id)
            Skill.all.each do |key|
	            if params[:"#{key.id}"].present?
	            	UserSkill.create(:student_id => student_id, :skill_id => key.id, :skill_level => params[:"#{key.id}"])
	            end
            end
         end

         def self.myskill_update(params,student_id)
            Skill.all.each do |key|
              if params[:"#{key.id}"].present?
                UserSkill.create(:student_id => student_id, :skill_id => key.id, :skill_level => params[:"#{key.id}"])
              end
            end
         end

         def self.education(params,student_id)
           if params[:degree_type].present? || params[:major].present? || params[:degree_gpa].present? || params[:degree_university].present? || params[:degree_university_loc].present? ||params[:certifications].present? || params[:certification_body].present?
              Education.create(:degree_type => params[:degree_type], :major => params[:major], :degree_gpa => params[:degree_gpa], :degree_university => params[:degree_university], 
                               :degree_university_loc => params[:degree_university_loc], :certifications => params[:certifications], 
                               :certification_body => params[:certification_body], :student_id => student_id, :position => 1)
           end

           if params[:degree_type1].present? || params[:major1].present? || params[:degree_gpa1].present? || params[:degree_university1].present? || params[:degree_university_loc1].present? ||params[:certifications1].present? || params[:certification_body1].present?
              Education.create(:degree_type => params[:degree_type1], :major => params[:major1], :degree_gpa => params[:degree_gpa1], :degree_university => params[:degree_university1], 
                               :degree_university_loc => params[:degree_university_loc1], :certifications => params[:certifications1], 
                               :certification_body => params[:certification_body1], :student_id => student_id, :position => 2)
           end
         end

         def self.student_work(params,student_id)
           if params[:company].present? || params[:company_location].present? || params[:dates_start].present? || params[:date_end].present? || params[:position].present?
              StudentWorkExp.create(:company => params[:company], :company_location => params[:company_location], 
                                    :dates_start => params[:dates_start], :date_end => params[:date_end], 
                                    :position =>params[:position],:student_id => student_id, :wposition => 1)
           end

           if params[:company1].present? || params[:company_location1].present? || params[:dates_start1].present? || params[:date_end1].present? || params[:position1].present?
              StudentWorkExp.create(:company => params[:company1], :company_location => params[:company_location1], 
                                    :dates_start => params[:dates_start1], :date_end => params[:date_end1], 
                                    :position =>params[:position1],:student_id => student_id, :wposition => 2)
           end
         end

         def self.update_myskill(params,student_id)
            Skill.all.each do |key|
              if params[:"#{key.id}"].present?
                @user_skill = UserSkill.where('student_id = ? and skill_id = ?', student_id.to_i ,key.id.to_i) rescue nil
                if @user_skill.present?
                  @user_skill[0].update(:skill_id =>key.id, :student_id => student_id,:skill_level => params[:"#{key.id}"])
                else
                  UserSkill.create(:student_id => student_id, :skill_id => key.id, :skill_level => params[:"#{key.id}"])
                end
              end
            end
         end

         def self.update_education(params,student_id)
            @education1 = Education.where('student_id = ? and position = ?',student_id, 1) rescue nil
            @education2 = Education.where('student_id = ? and position = ?',student_id, 2) rescue nil
            if @education1[0].present?
              if params[:degree_type].present? || params[:major].present? || params[:degree_gpa].present? || params[:degree_university].present? || params[:degree_university_loc].present? ||params[:certifications].present? || params[:certification_body].present?
                @education1[0].update(:degree_type => params[:degree_type], :major => params[:major], :degree_gpa => params[:degree_gpa], :degree_university => params[:degree_university], 
                               :degree_university_loc => params[:degree_university_loc], :certifications => params[:certifications], 
                               :certification_body => params[:certification_body], :student_id => student_id, :position => 1)
              end
            else
               if params[:degree_type].present? || params[:major].present? || params[:degree_gpa].present? || params[:degree_university].present? || params[:degree_university_loc].present? ||params[:certifications].present? || params[:certification_body].present?
                  Education.create(:degree_type => params[:degree_type], :major => params[:major], :degree_gpa => params[:degree_gpa], :degree_university => params[:degree_university], 
                               :degree_university_loc => params[:degree_university_loc], :certifications => params[:certifications], 
                               :certification_body => params[:certification_body], :student_id => student_id, :position => 1)
               end
            end
            
            if @education2[0].present?
              if params[:degree_type1].present? || params[:major1].present? || params[:degree_gpa1].present? || params[:degree_university1].present? || params[:degree_university_loc1].present? ||params[:certifications1].present? || params[:certification_body1].present?
                @education2[0].update(:degree_type => params[:degree_type1], :major => params[:major1], :degree_gpa => params[:degree_gpa1], :degree_university => params[:degree_university1], 
                               :degree_university_loc => params[:degree_university_loc1], :certifications => params[:certifications1], 
                               :certification_body => params[:certification_body1], :student_id => student_id, :position => 2)
              end
            else
               if params[:degree_type1].present? || params[:major1].present? || params[:degree_gpa1].present? || params[:degree_university1].present? || params[:degree_university_loc1].present? ||params[:certifications1].present? || params[:certification_body1].present?
                 Education.create(:degree_type => params[:degree_type1], :major => params[:major1], :degree_gpa => params[:degree_gpa1], :degree_university => params[:degree_university1], 
                               :degree_university_loc => params[:degree_university_loc1], :certifications => params[:certifications1], 
                               :certification_body => params[:certification_body1], :student_id => student_id, :position => 2)
              end
            end

         end

         def self.update_student_work(params,student_id)
           @student_work_exp1 = StudentWorkExp.where('student_id = ? and  wposition = ?',student_id, 1) rescue nil
           @student_work_exp2 = StudentWorkExp.where('student_id = ? and  wposition = ?',student_id, 2) rescue nil
           if @student_work_exp1[0].present?
             if params[:company].present? || params[:company_location].present? || params[:dates_start].present? || params[:date_end].present? || params[:position].present?
                @student_work_exp1[0].update(:company => params[:company].present? ? params[:company] : nil, :company_location => params[:company_location], 
                                      :dates_start => params[:dates_start], :date_end => params[:date_end], 
                                      :position =>params[:position],:student_id => student_id, :wposition => 1)
             end
           else
              if params[:company].present? || params[:company_location].present? || params[:dates_start].present? || params[:date_end].present? || params[:position].present?
                StudentWorkExp.create(:company => params[:company], :company_location => params[:company_location], 
                                    :dates_start => params[:dates_start], :date_end => params[:date_end], 
                                    :position =>params[:position],:student_id => student_id, :wposition => 1)
              end
           end
           if @student_work_exp2[0].present?
             if params[:company1].present? || params[:company_location1].present? || params[:dates_start1].present? || params[:date_end1].present? || params[:position1].present?
                @student_work_exp2[0].update(:company => params[:company1].present? ? params[:company1] : nil  , :company_location => params[:company_location1], 
                                      :dates_start => params[:dates_start1], :date_end => params[:date_end1], 
                                      :position =>params[:position1],:student_id => student_id, :wposition => 2)
             end
           else
             if params[:company1].present? || params[:company_location1].present? || params[:dates_start1].present? || params[:date_end1].present? || params[:position1].present?
                StudentWorkExp.create(:company => params[:company1], :company_location => params[:company_location1], 
                                    :dates_start => params[:dates_start1], :date_end => params[:date_end1], 
                                    :position =>params[:position1],:student_id => student_id, :wposition => 2)
              end
           end

         end


         def self.semester(params,student_id)
            #raise (params[:year].strftime("%yy")).inspect
            SemesterRegistered.create(:semester => params[:semester], :student_year => params[:year], :student_id => student_id)
         end

         def self.update_semester(params,student_id)
            @semester = SemesterRegistered.where('student_id = ?',student_id) rescue nil 
            if @semester.present?
              @semester[0].update(:semester => params[:semester], :student_year => params[:year], :student_id => student_id)
            else
              SemesterRegistered.create(:semester => params[:semester], :student_year => params[:year], :student_id => student_id)
            end 
         end
end