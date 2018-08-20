class CreateEtfs < ActiveRecord::Migration[5.1]
  def change
    create_table :etfs do |t|
      t.string :ticker
      t.string :name
      t.integer :user_id
      t.string :rating
      t.float :fee
      t.string :similarity_ranking

      t.timestamps
    end
  end
end
