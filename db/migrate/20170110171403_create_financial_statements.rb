class CreateFinancialStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_statements do |t|
      t.belongs_to :account, index: true
      t.integer :withdrawal, default: 0
      t.integer :deposit, default: 0
      t.integer :balance, default: 0
      t.timestamps
    end
  end
end
