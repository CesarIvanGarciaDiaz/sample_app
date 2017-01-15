class CreateHistoryMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :history_movements do |t|

      t.timestamps
    end
  end
end
