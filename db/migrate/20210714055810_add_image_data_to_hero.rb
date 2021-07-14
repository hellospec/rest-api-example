class AddImageDataToHero < ActiveRecord::Migration[6.1]
  def change
    add_column :heros, :image_data, :text
  end
end
