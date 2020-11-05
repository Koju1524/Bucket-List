class RemoveNecessaryStuffFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :necessary_stuff, :text
  end
end
