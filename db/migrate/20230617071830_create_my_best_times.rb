class CreateMyBestTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :my_best_times do |t|
      t.integer :user_id
      t.integer :circuit_track_id
      t.string :my_best_time
    end
  end
end
