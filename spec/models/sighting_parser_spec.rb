require 'rails_helper'

RSpec.describe SightingParsers::SightingParser do
  it 'does not implement get_sightings_info' do
    expect{ SightingParsers::SightingParser.get_sightings_info }.to raise_error(RuntimeError)
  end
end