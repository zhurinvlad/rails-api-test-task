class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string  :isbn,   null: false
      t.string  :title,  null: false
      t.text    :description
      t.integer :pages
      t.string  :website
      t.date    :published, null: false

      t.timestamps
    end

    add_index :books, :isbn, unique: true
    add_index :books, :title
    add_index :books, :published
  end
end
