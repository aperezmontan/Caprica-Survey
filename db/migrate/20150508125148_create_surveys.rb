class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
     t.string :title, null: false
     t.integer :creator_id, null: false
     t.string :status, default: "open"
     t.integer :response_count, default: 0
     t.integer :closing_number, default: 5

    t.timestamps
    end
  end
end
