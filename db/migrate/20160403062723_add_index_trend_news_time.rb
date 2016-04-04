class AddIndexTrendNewsTime < ActiveRecord::Migration
  def change
    add_index :trend_news, :Time
  end
end
