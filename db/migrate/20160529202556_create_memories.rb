class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :name
      t.string :description
      t.integer :age
      t.date :date
      t.string :hometown

      t.timestamps null: false
    end
  end
end
