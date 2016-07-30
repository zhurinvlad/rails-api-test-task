class AddAuthorReferenceIntoBooks < ActiveRecord::Migration[5.0]
  def change
    # NOTE: I don't use foreign key for flexibility
    add_reference :books, :author, null: false, default: 0, index: true
  end
end
