class AddImageToRovers < ActiveRecord::Migration
  def change
    add_column :rovers, :image_url, :string
  end
end
