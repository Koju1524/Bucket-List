class CreateThumbsUps < ActiveRecord::Migration[6.0]
  def change
    create_table :thumbs_ups do |t|
      t.references :user, null: false
      t.references :article
      t.references :achieved_article, null: false
      t.timestamps
    end
  end
end
