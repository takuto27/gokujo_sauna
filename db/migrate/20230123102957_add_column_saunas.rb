class AddColumnSaunas < ActiveRecord::Migration[6.1]
  def change
    add_column :saunas, :prefecture, :integer
  end
end
