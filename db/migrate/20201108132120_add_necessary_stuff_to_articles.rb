class AddNecessaryStuffToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :necessary_stuff, :text
  end
end
