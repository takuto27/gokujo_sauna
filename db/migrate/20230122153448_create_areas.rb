class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|

      t.integer :ride_area, null: false, default: 0

      t.timestamps
    end
  end
end
