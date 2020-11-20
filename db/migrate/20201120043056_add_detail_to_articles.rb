class AddDetailToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :feeling, :text
    add_column :articles, :advice, :text
    add_column :articles, :achieved_day, :date
  end
end
