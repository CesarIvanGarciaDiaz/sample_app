class CreateMovementParents < ActiveRecord::Migration[5.0]
  def change
    create_table :movement_parents do |t|
      t.belongs_to :movement, index:true
      t.integer :child_id
      t.boolean :parent
      t.timestamps
    end
  end
end
