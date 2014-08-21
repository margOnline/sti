class AddTribeIdToAnimal < ActiveRecord::Migration
  def up
    add_column :animals, :tribe_id, :integer
  end

  def down
    remove_column :animals, :tribe_id
  end
en
