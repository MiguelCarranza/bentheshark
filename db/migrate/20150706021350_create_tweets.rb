class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string        :twitter_id, null: false
      t.string        :text,       null: false

      t.timestamps null: false
    end

    add_index :tweets, :twitter_id, unique: true
  end
end
