class CreateMovementParents < ActiveRecord::Migration[5.0]
  def change
    create_table :movement_parents do |t|
      t.belongs_to :movement, index:true
      t.integer :child_id
      t.integer :movement_parent
      t.integer :movement_child
      t.boolean :parent, default: false         # si el movimiento es padre de otro
      t.boolean :iva, default: false            # si ya aplico el iva o no
      t.timestamps
    end
  end
end
