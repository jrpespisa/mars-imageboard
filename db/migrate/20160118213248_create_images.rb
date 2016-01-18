class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.string :description
      t.belongs_to :rover

      t.timestamps null: false
    end
  end
end
