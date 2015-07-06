class PostTweetsJob < BenJob
  SIGHTING_SIMULTANEOUS_TWEETS = 2

  def perform
    twitter_facade = TwitterFacade.new
    post_sightings_tweets twitter_facade
  end

  private
  def post_sightings_tweets(twitter_facade)
    sightings = Sighting.order(date: :desc).limit(SIGHTING_SIMULTANEOUS_TWEETS).reverse

    sightings.each do |sighting|
      if sighting.tweet.nil?
        tweet_message = TweetGenerator.sighting_message(sighting.spot, 
                                                        sighting.date)
        if valid_tweet_message? tweet_message
          tweet_spot = twitter_facade.find_spot(sighting.spot)

          tweet_post_result = twitter_facade.tweet(tweet_message, tweet_spot)
          tweet = Tweet.create(twitter_id: tweet_post_result.id,
                               text: tweet_post_result.text)
          sighting.tweet = tweet
          sighting.save
        end
      end
    end
  end

  def valid_tweet_message?(message)
    message.length <= 140 && message.length > 0
  end
end

if __FILE__ == $0
  PostTweetsJob.new.perform
end