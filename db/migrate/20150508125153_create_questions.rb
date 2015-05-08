class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description, null: false, length: {minimum: 3}
      t.integer :survey_id, null: false

      t.timestamps
    end
  end
end
