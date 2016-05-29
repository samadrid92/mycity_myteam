class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.date :date_founded
      t.string :colors
      t.integer :total_championships
      t.string :history
      t.string :venue

      t.timestamps null: false
    end
  end
end
