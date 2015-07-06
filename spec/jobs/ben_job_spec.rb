require 'rails_helper'

RSpec.describe BenJob do
  it 'subclass must implement perform' do
    expect { BenJob.new.perform }.to raise_error(RuntimeError)
  end
end