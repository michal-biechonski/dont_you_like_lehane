class AddIndexToComments < ActiveRecord::Migration[5.0]
  def change
    add_index :comments, :book_id
    add_foreign_key :comments, :book_id
  end
end
