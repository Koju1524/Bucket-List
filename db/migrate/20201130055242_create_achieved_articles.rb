class CreateAchievedArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :achieved_articles do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :impression, null: false
      t.text :advice, null: false
      t.date :achieved_day, null: false
      t.timestamps
    end
  end
end
