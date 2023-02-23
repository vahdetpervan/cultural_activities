# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe CreateEventsWorker do
  it 'places job in correct queue' do
    described_class.perform_async
    expect(described_class.queue).to eq('default')
  end

  it 'goes into the jobs array for testing environment' do
    VCR.use_cassette('web_scrapers/co_berlin/events') do
      expect { described_class.perform_async }.to change(described_class.jobs, :size).by(1)
    end
  end

  it 'changes the Event count' do
    VCR.insert_cassette('web_scrapers/co_berlin/events')
    VCR.insert_cassette('web_scrapers/berghain/events')
    expect { described_class.new.perform }.to change(Event, :count).from(0).to(24)
  end
end
