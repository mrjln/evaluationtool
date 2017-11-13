class AddStudentToBatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :batches, :student, foreign_key: true
  end
end
