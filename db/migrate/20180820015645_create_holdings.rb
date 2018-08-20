class CreateHoldings < ActiveRecord::Migration[5.1]
  def change
    create_table :holdings do |t|
      t.integer :user_id
      t.integer :fund_id

      t.timestamps
    end
  end
end
