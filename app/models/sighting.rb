class Sighting < ActiveRecord::Base
  belongs_to :tweet

  def self.exist?(spot, date)
    Sighting.where(spot: spot, date: date).count > 0
  end
end
