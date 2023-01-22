class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :customer_id, null: false
      t.integer :sauna_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :favorite, null: false
      t.boolean :is_deleted, null: false, default: "FALSE"

      t.timestamps
    end
  end
end
