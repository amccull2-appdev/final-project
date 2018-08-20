class AddProviderToEtfs < ActiveRecord::Migration[5.1]
  def change
    add_column :etfs, :provider, :string
  end
end
