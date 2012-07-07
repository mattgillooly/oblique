class AddTweetHourlyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tweet_hourly, :boolean, null: false, default: false
  end
end
