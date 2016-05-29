class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city_name
      t.date :date_founded
      t.float :population
      t.string :nicknames
      t.string :header_pic

      t.timestamps null: false
    end
  end
end
