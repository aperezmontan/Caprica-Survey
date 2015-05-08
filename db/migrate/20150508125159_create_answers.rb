class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description
      t.integer :question_id
      t.boolean :required, default: :true

      t.timestamps
    end
  end
end
