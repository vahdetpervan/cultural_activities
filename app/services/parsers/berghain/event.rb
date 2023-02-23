module Parsers
  module Berghain
    class Event
      def initialize(scraper: ::WebScrapers::Event.new)
        @scraper = scraper
      end

      def parse
        Nokogiri::HTML(response).css('a.upcoming-event').each_with_object([]) do |tag, array|
          array << {
            title: tag.css('p + h2').first.content.strip,
            start_date: build_date(tag),
            end_date: build_date(tag),
            web_source: 'Berghain'
          }
        end
      end

      private

      def response
        @scraper.all(url: 'https://www.berghain.berlin/en/program/')
      end

      def build_date(tag)
        "#{tag.css('p span').first.content.strip} #{tag.css('p').first.content}".split.first
      end
    end
  end
end
