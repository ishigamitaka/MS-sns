class CreateMycars < ActiveRecord::Migration[6.1]
  def change
    create_table :mycars do |t|
      
      t.timestamps
    end
  end
end
