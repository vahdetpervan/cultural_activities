# frozen_string_literal: true

require 'open-uri'

module WebScrapers
  class Event
    def all(url:)
      URI.parse(url).open
    end
  end
end
