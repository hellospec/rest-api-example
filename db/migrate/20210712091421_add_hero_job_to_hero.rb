class AddHeroJobToHero < ActiveRecord::Migration[6.1]
  def change
    add_column :heros, :job, :string
  end
end
