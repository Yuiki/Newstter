class AddAndDeleteColumnsToTrendsNews < ActiveRecord::Migration
  def change
    remove_column :trend_news, :Idx
    add_column :trend_news, :Time, :datetime
  end
end
