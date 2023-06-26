class CreateParts < ActiveRecord::Migration[6.1]
  def change
    create_table :parts do |t|
      t.integer :user_id, null: false
      t.string :parts_name, null: false
      t.string :howmuch
      t.string :effect
      t.string :review, null: false
      t.timestamps
    end
  end
end
