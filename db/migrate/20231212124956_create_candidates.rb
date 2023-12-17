class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :cv_rating
      t.string :availability
      t.string :interview_stage
      t.string :phone_number
      t.string :email
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
