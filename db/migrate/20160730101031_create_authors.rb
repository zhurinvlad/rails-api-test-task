class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :about

      t.timestamps
    end

    add_index :authors, [:first_name, :last_name], unique: true
  end
end