# frozen_string_literal: true

class CreateEventsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  PARSERS = [
    Parsers::CoBerlin::Event,
    Parsers::Berghain::Event
  ].freeze

  def perform
    parsed_responses.each do |response|
      Event.upsert(response, unique_by: 'index_events_on_title_and_start_date')
    end
  end

  private

  def parsed_responses
    PARSERS.each_with_object([]) do |parser, array|
      array.concat(parser.new.parse)
    end
  end
end

Sidekiq::Cron::Job.create(name: 'Event worker', cron: '0 0 * * *', class: 'CreateEventsWorker')
