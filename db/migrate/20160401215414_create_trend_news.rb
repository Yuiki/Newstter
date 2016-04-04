class CreateTrendNews < ActiveRecord::Migration
  def change
    create_table :trend_news do |t|
      t.integer :Idx
      t.string :Title
      t.string :Url
      t.string :Source
      t.string :Description
      t.string :Name
      t.datetime :Date

      t.timestamps null: false
    end
  end
end