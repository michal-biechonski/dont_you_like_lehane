class AddIndexesToReadersAndFutureReaders < ActiveRecord::Migration[5.0]
  def change
    add_index :readers, [:user, :book], unique: true
    add_index :future_readers, [:user, :book], unique: true
  end
end
