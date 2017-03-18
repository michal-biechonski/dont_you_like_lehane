class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :author, default: "Dennis Lehane"
      t.string :title
      t.text :description
      t.string :picture
      t.datetime :published_at

      t.timestamps
    end
  end
end
