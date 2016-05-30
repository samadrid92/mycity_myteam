class AddForeignKeyToMemories < ActiveRecord::Migration
  def change
    add_reference :memories, :user, index: true, foreign_key: true
    add_reference :memories, :team, index: true, foreign_key: true
  end
end
