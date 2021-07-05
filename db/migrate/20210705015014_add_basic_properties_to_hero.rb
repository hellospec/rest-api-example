class AddBasicPropertiesToHero < ActiveRecord::Migration[6.1]
  def change
    add_column :heros, :level, :integer, default: 1
    add_column :heros, :hp, :integer, default: 0
    add_column :heros, :mp, :integer, default: 0
  end
end
