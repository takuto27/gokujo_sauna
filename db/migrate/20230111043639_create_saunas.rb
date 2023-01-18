class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|


      #t.references :tag, null: false, foreign_key: true
      t.string :sauna_name, null: false
      t.text :introduction, null: false, default: ""
      t.string :sauna_temperature, null: false
      t.string :water_temperature, null: false
      t.string :access, null: false
      t.boolean :is_active, null: false, default: "TRUE"


      t.timestamps
    end
  end
end
