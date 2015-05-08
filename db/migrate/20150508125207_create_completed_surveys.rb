class CreateCompletedSurveys < ActiveRecord::Migration
  def change
    create_table :completed_surveys do |t|
      t.integer :survey_id
      t.integer :answer_id
      t.string :taker_response
      t.integer :taker_id

      t.timestamps
    end
  end
end
