class AddTweetToSightings < ActiveRecord::Migration
  def change
    add_column :sightings, :tweet_id, :integer, null: true
    add_index :sightings, :tweet_id, unique: true
    add_foreign_key :sightings, :tweets
  end
end
