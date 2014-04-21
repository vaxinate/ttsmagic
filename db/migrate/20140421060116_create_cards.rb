class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :gatherer_id
      t.string :name
      t.string :mana
      t.string :image_url

      t.timestamps
    end
  end
end
