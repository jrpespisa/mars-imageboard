class CreateRovers < ActiveRecord::Migration
  def change
    create_table :rovers do |t|
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
