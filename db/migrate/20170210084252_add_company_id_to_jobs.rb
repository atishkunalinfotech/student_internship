class AddCompanyIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :company_id, :integer
    add_column :jobs, :status, :string
    add_column :jobs, :publish_unpublish, :boolean, :default => false
  end
end
