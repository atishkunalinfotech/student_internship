class AddPaidToStudents < ActiveRecord::Migration
  def change
    add_column :students, :paid_status, :string
  end
end
