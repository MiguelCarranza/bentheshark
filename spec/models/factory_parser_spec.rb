require 'rails_helper'

RSpec.describe SightingParsers::ParserFactory do
  it 'returns all parsers' do
    all_parsers = [SightingParsers::SRCParser]
    expect(SightingParsers::ParserFactory.all_parsers).to eq(all_parsers)
  end
end