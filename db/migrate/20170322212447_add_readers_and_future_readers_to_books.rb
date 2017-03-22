class AddReadersAndFutureReadersToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :reader_id, :integer
    add_column :books, :future_reader_id, :integer
  end
end
