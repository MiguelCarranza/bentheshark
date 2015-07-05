require 'open-uri'
require 'htmlentities'

class SightingParsers::SRCParser < SightingParsers::SightingParser
  URL = ENV.fetch('SRC_URL', 
                  'http://www.sharkresearchcommittee.com/pacific_coast_shark_news.htm')

  WHITE_LIST_SPOT_NAMES = ['beach', 'harbor', 'point']
  BLACK_LIST_SPOT_NAMES = ['memoriam', 'notice']

  def self.get_sightings_info
    sightings = []

    begin 
      doc = Nokogiri::HTML(open URL)
      paragraphs = doc.css 'p'
      candidate_paragraphs = possible_sightings paragraphs
      sightings = candidate_paragraphs.map { |c| parse_possible_sighting(c) }
      sightings.select! { |s| !s.nil? }
    rescue OpenURI::HTTPError
    end

    sightings
  end

  private
  def self.possible_sightings(paragraphs)
    dash = HTMLEntities.new.decode "&#151;"
    paragraphs.select { |p| HTMLEntities.new.decode(p.to_s).include? dash } 
  end

  def self.parse_possible_sighting(html)
    spot = html.css('strong').first
    spot = spot.text.strip if spot
    spot = (validate_spot_name spot) ? spot : nil
    date = extract_date(html.text)

    make_sighting(date, spot) if date and spot
  end

  def self.validate_spot_name(spot_name)
    (WHITE_LIST_SPOT_NAMES.select { |white| spot_name.downcase.include? white}.count > 0 ||
     BLACK_LIST_SPOT_NAMES.select { |black| spot_name.downcase.include? black}.count == 0)
  end

  def self.extract_date(html)
    begin 
      Date.parse html
    rescue ArgumentError
    end
  end

  def self.make_sighting(date, spot)
    { "date" => date,
      "spot" => spot
    }
  end
end