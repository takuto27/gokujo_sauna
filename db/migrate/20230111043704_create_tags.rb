class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|

      #t.references :sauna, null: false, foreign_key: true
      t.string :tag_name, null: false

      t.timestamps
    end
  end
end
