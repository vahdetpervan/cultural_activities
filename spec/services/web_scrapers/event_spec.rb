# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebScrapers::Event do
  describe '#all' do
    it 'returns a 200 response' do
      VCR.use_cassette('web_scrapers/co_berlin/events') do
        expect(described_class.new.all(url: 'https://www.co-berlin.org/en/program/calendar').status.first).to eq('200')
      end
    end
  end
end
