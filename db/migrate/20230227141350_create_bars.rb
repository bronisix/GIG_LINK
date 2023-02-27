class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :location
      t.string :url
      t.string :telephone
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
