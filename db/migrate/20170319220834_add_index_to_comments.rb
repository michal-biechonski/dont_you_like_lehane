class AddIndexToComments < ActiveRecord::Migration[5.0]
  def change
    add_index :comments, :book
    add_foreign_key :comments, :book
  end
end
