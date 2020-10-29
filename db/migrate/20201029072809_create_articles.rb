class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :reason, null: false
      t.text :necessary_stufft, null: false
      t.date :expiration, null: false
      t.integer :achievement_flag, null: false
      t.timestamps
    end
  end
end
