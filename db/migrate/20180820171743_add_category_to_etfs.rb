class AddCategoryToEtfs < ActiveRecord::Migration[5.1]
  def change
    add_column :etfs, :category, :string
  end
end
