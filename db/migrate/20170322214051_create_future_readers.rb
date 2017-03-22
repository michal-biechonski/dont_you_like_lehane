class CreateFutureReaders < ActiveRecord::Migration[5.0]
  def change
    create_table :future_readers do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
