class CreateAchievedArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :achieved_articles do |t|
      t.references :user, null: false
      t.references :article, null: false
      t.string :title, null: false
      t.text :impression
      t.text :advice
      t.date :achieved_day
      t.timestamps
    end
  end
end
