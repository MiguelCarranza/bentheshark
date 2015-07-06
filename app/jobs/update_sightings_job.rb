class UpdateSightingsJob < BenJob
  def perform
    new_sightings = 0
    SightingParsers::ParserFactory.all_parsers.each do |parser|
      sightings_info = parser.get_sightings_info
      log_error 'No sightings found' if sightings_info.count == 0

      sightings_info.each do |info|
        spot = info['spot']
        date = info['date']
        if !Sighting.exist? spot, date
          Sighting.create(spot: spot, date: date)
          new_sightings += 1
          log_info "New sighting at #{spot} on #{date}"
        end
      end
    end

    log_info "#{new_sightings} new sightings added."
  end
end

if __FILE__ == $0
  UpdateSightingsJob.new.perform
end