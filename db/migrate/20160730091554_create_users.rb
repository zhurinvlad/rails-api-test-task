class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email,           null: false
      t.string :password_digest, null: false
      t.date   :birthday
      t.string :website
      t.text   :about

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
