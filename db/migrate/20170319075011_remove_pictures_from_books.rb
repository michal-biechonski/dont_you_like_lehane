class RemovePicturesFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :picture, :string
  end
end
