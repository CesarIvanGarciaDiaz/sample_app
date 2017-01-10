class CreateFinancialStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_statements do |t|
      t.integer :withdrawal
      t.integer :deposit
      t.integer :balance

      t.timestamps
    end
  end
end
