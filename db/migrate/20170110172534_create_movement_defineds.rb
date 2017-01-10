class CreateMovementDefineds < ActiveRecord::Migration[5.0]
  def change
    create_table :movement_defineds do |t|
      t.belongs_to :movement, index: true
      t.string :detail
      t.integer :total_amount
      t.integer :comission

      t.timestamps
    end
  end
end
