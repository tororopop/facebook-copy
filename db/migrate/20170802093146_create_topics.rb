class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :caption
      t.string :file

      t.timestamps null: false
    end
  end
end
