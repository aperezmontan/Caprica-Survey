class ChangeUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove    :password_hash
      t.string    :password_digest, null: false
      t.remove    :name
      t.string    :name, null: false
    end
  end
end
