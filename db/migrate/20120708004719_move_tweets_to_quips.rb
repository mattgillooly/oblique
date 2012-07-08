class MoveTweetsToQuips < ActiveRecord::Migration
  def change
    rename_table :tweets, :quips
  end
end
