class RenameMainCircuitColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :main_circuit, :circuit_track_id
    change_column :users, :circuit_track_id, :integer
  end
end
