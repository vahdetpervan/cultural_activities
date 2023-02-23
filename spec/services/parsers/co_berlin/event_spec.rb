# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::CoBerlin::Event do
  describe '#parse' do
    it 'parses the data specific to our domain' do
      VCR.use_cassette('web_scrapers/co_berlin/events') do
        expect(described_class.new.parse).to eq(expected_parsed_data)
      end
    end

    def expected_parsed_data
      [
        { title: 'Looking at Eggleston I', start_date: '22 Feb 2023', end_date: '22 Feb 2023',
          web_source: 'Co Berlin' },
        { title: 'Painting with light ', start_date: '25 Feb 2023', end_date: '26 Feb 2023', web_source: 'Co Berlin' },
        { title: "Curator's Tour", start_date: '28 Feb 2023', end_date: '28 Feb 2023', web_source: 'Co Berlin' },
        { title: 'Artist Talk + Lecture', start_date: '07 Mar 2023', end_date: '07 Mar 2023', web_source: 'Co Berlin' },
        { title: 'Looking at Eggleston II', start_date: '09 Mar 2023', end_date: '09 Mar 2023',
          web_source: 'Co Berlin' },
        { title: 'From scratch', start_date: '11 Mar 2023', end_date: '12 Mar 2023', web_source: 'Co Berlin' },
        { title: 'After-Work Tour + Drink', start_date: '23 Mar 2023', end_date: '23 Mar 2023',
          web_source: 'Co Berlin' },
        { title: 'The curtain falls', start_date: '25 Mar 2023', end_date: '26 Mar 2023', web_source: 'Co Berlin' },
        { title: 'Holiday Special: Berlin-Booklet', start_date: '03 Apr 2023', end_date: '06 Apr 2023',
          web_source: 'Co Berlin' },
        { title: 'Finding Your Voice as a Photographer', start_date: '09 May 2023', end_date: '13 Jun 2023',
          web_source: 'Co Berlin' },
        { title: 'Grass-green and raspberry-red ', start_date: '03 Jun 2023', end_date: '04 Jun 2023',
          web_source: 'Co Berlin' },
        { title: 'Image Fantastique', start_date: '17 Jun 2023', end_date: '18 Jun 2023', web_source: 'Co Berlin' }
      ]
    end
  end
end
