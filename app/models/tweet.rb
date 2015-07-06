class Tweet < ActiveRecord::Base
  has_one :sighting
end
