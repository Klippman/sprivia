class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :points
      t.string :time

      t.timestamps
    end
  end
end
