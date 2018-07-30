class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :content
      t.integer :length

      t.timestamps
    end
  end
end
