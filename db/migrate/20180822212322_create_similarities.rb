class CreateSimilarities < ActiveRecord::Migration[5.1]
  def change
    create_table :similarities do |t|
      t.integer :primary_fund
      t.integer :foreign_fund
      t.integer :ranking

      t.timestamps
    end
  end
end
