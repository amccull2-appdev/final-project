class CreateSimilarities < ActiveRecord::Migration[5.1]
  def change
    create_table :similarities do |t|
      t.string :primary_fund
      t.string :foreign_fund
      t.integer :ranking

      t.timestamps
    end
  end
end
