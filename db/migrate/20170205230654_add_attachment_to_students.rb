class AddAttachmentToStudents < ActiveRecord::Migration
  def change
    add_column :students, :attachment, :string
  end
end
