module ApplicationHelper
  def today
    Time.now.in_time_zone('America/Los_Angeles').to_date
  end
end
