class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.text :bio
      t.string :location
      t.date :birthday
      t.boolean :subscribed, default: false
      t.timestamps
    end
  end
end
