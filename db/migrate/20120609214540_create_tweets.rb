class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id, null: false
      t.string :text, null: false

      t.timestamps
    end

    add_index :tweets, :user_id
  end
end
