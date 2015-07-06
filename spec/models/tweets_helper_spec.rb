require 'rails_helper'
include TweetsHelper

RSpec.describe TweetsHelper do
  describe 'sightings_tweets' do
    it 'contains placeholders for spot and date' do
      spot = 'Fort Point'
      date = '3 days ago'

      sightings_tweets.each do |pattern|
        tweet = pattern % [spot, date]
        expect(tweet.include? spot).to be true
        expect(tweet.include? date).to be true
      end
    end
  end
end