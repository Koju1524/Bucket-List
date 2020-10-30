class ChangeSomeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :necessary_stufft, :necessary_stuff
  end
end
