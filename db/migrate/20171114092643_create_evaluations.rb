class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.references :student, foreign_key: true
      t.date :evaluation_date
      t.string :color

      t.timestamps
    end
  end
end
