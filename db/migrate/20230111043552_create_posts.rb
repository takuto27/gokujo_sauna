class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.references :customer, null: false, foreign_key: true
      t.references :sauna, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.integer :favorite, null: false
      t.boolean :is_deleted, null: false
      
      t.timestamps
    end
  end
end
