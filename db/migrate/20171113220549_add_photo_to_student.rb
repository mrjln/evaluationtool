class AddPhotoToStudent < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :photo, foreign_key: true
  end
end
