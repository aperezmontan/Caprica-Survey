class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description, null: false, length: {minimum: 3}
      t.integer :question_id, null: false
      t.boolean :required, default: true

      t.timestamps
    end
  end
end
