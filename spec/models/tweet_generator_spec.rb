require 'rails_helper'

RSpec.describe TweetGenerator do
  describe 'formats date properly' do
    it 'today' do
      spot_name = 'The Hook!'
      date = Date::today
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? 'this morning').to be true
    end

    it 'yesterday' do
      spot_name = 'Ocean Beach'
      date = Date::today - 1.days
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? 'yesterday').to be true
    end

    it '2 days ago' do
      spot_name = 'Steamer Lane'
      date = Date::today - 2.days
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? 'two days ago').to be true
    end

    it '3 days ago' do
      spot_name = 'County Line'
      date = Date::today - 3.days
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? 'three days ago').to be true
    end

    it '4 days ago' do
      spot_name = 'Rincon'
      date = Date::today - 4.days
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? 'four days ago').to be true
    end

    it 'more than 4 days ago' do
      spot_name = 'Lower Trestles'
      date = Date::today - 5.days
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? "on #{Date::MONTHNAMES[date.month]} #{date.day}").to be true
    end

    it 'date in the future' do
      spot_name = 'Upper Trestles'
      date = Date.new(2034, 11, 2)
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? 'on November 2').to be true
    end

    it 'day with 2 digits also contains a space' do
      spot_name = 'Upper Trestles'
      date = Date.new(2034, 10, 29)
      message = TweetGenerator.sighting_message spot_name, date
     
      expect(message.include? spot_name).to be true
      expect(message.include? 'on October 29').to be true
    end
  end
end
