include TweetsHelper
include ApplicationHelper

class TweetGenerator
  def self.sighting_message(spot, date)
    message = ""
    n_iter = 0

    until (valid_message? message ||
           n_iter > (sightings_tweets.count * 4)) do 
      n_iter += 1
      pattern =  sightings_tweets[rand(sightings_tweets.count)]
      message = pattern % [spot, process_date(date)]
    end
    message
  end

  private
  def self.process_date(date)
    case (today - date)
    when 0
      'this morning'
    when 1
      'yesterday'
    when 2
      'two days ago'
    when 3
      'three days ago'
    when 4
      'four days ago'
    else
      "on #{Date::MONTHNAMES[date.month]} #{date.day}"
    end
  end

  def self.valid_message?(message)
    message.length <= 140 && message.length > 0
  end
end