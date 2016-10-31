class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :song
      t.string :artist
      t.string :album
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
