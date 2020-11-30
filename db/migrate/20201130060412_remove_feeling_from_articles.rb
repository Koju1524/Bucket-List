class RemoveFeelingFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :feeling, :text
    remove_column :articles, :advice, :text
    remove_column :articles, :achieved_day, :text
  end
end
