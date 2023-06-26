class CreateTrackEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :track_events do |t|
      #t.integer :circuit_track_id
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :run_category, null: false
      t.datetime :run_date, null: false
      t.integer :price, null: false
      t.integer :number_people, null: false
      t.timestamps
    end
  end
end
