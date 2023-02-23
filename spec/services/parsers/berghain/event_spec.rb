# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::Berghain::Event do
  describe '#parse' do
    it 'parses the data specific to our domain' do
      VCR.use_cassette('web_scrapers/berghain/events') do
        expect(described_class.new.parse).to eq(expected_parsed_data)
      end
    end

    def expected_parsed_data
      [
        { title: 'PAN x Natural Mind | Never Sleep', start_date: '24.02.2023', end_date: '24.02.2023',
          web_source: 'Berghain' },
        { title: 'Klubnacht', start_date: '25.02.2023', end_date: '25.02.2023', web_source: 'Berghain' },
        { title: 'JACK YOUR BODY', start_date: '03.03.2023', end_date: '03.03.2023', web_source: 'Berghain' },
        { title: 'Klubnacht', start_date: '04.03.2023', end_date: '04.03.2023', web_source: 'Berghain' },
        { title: '1. FC GRRRLS UNITED', start_date: '07.03.2023', end_date: '07.03.2023', web_source: 'Berghain' },
        { title: 'Fever AM', start_date: '10.03.2023', end_date: '10.03.2023', web_source: 'Berghain' },
        { title: 'Klubnacht', start_date: '11.03.2023', end_date: '11.03.2023', web_source: 'Berghain' },
        { title: 'Love On The Rocks', start_date: '17.03.2023', end_date: '17.03.2023', web_source: 'Berghain' },
        { title: 'Klubnacht', start_date: '18.03.2023', end_date: '18.03.2023', web_source: 'Berghain' },
        { title: 'YOUR LOVE', start_date: '24.03.2023', end_date: '24.03.2023', web_source: 'Berghain' },
        { title: 'Klubnacht', start_date: '25.03.2023', end_date: '25.03.2023', web_source: 'Berghain' },
        { title: 'DWELLER', start_date: '31.03.2023', end_date: '31.03.2023', web_source: 'Berghain' }
      ]
    end
  end
end
