class AddIndexesToReadersAndFutureReaders < ActiveRecord::Migration[5.0]
  def change
    add_index :readers, [:user_id, :book_id], unique: true
    add_index :future_readers, [:user_id, :book_id], unique: true
  end
end
