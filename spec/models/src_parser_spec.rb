require 'rails_helper'
require Rails.root.join("spec/support/html_response_helper")

RSpec.describe SightingParsers::SRCParser do
  include HTMLResponseHelper
  
  describe 'something went wrong' do
    it 'does not freak out if there is a network problem' do
      stub_network_problem
      expect(SightingParsers::SRCParser.get_sightings_info).to eq([])
    end

    it 'does not freak out if html is super invalid' do
      stub_invalid_response
      expect(SightingParsers::SRCParser.get_sightings_info).to eq([])
    end
  end

  describe 'all systems go' do
    it "parses the source properly" do
      stub_proper_response
      sightings = SightingParsers::SRCParser.get_sightings_info
      
      expect(sightings.count).to eq(60)
      expect(sightings[0]['spot']).to eq('San Clemente')
      expect(sightings[0]['date']).to eq(Date.new(2015, 6, 29))
      expect(sightings[-1]['spot']).to eq('Ventura')
      expect(sightings[-1]['date']).to eq(Date.new(2015, 1, 10))
    end
  end

  def stub_proper_response
    stub_request(:get, SightingParsers::SRCParser::URL).
         to_return(:status => 200, 
                   :body => valid_src_html)
  end

  def stub_network_problem
    stub_request(:get, SightingParsers::SRCParser::URL).
         to_return(:status => 500)
  end

  def stub_invalid_response
    stub_request(:get, SightingParsers::SRCParser::URL).
         to_return(:status => 200,
                   :body => 'M<>uhjkhgbnm2')
  end
end