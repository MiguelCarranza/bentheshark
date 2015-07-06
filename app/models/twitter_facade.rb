class TwitterFacade
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def tweet(msg, place=nil)
    @client.update(msg, 
                   place: place, 
                   display_coordinates: !place.nil?)
  end

  def find_spot(spot_name)
    @client.geo_search(query: spot_name).first
  end
end