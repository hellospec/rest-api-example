class CreateHeros < ActiveRecord::Migration[6.1]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :occupation, default: 'squire'
      t.string :gender, default: 'male'

      t.timestamps
    end
  end
end
