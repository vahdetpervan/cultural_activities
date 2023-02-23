module Parsers
  module CoBerlin
    class Event
      def initialize(scraper: ::WebScrapers::Event.new)
        @scraper = scraper
      end

      def parse
        Nokogiri::HTML(response).css('article .node--type-event.node--view-mode-calendar').each_with_object([]) do |tag, array|
          array << {
            title: tag.css('.field--name-title h2').first.content,
            start_date: format_date(extract_date(tag).first),
            end_date: format_date(extract_date(tag).last),
            web_source: 'Co Berlin'
          }
        end
      end

      private

      def response
        @scraper.all(url: 'https://www.co-berlin.org/en/program/calendar')
      end

      def format_date(date_str)
        date_str.to_date.strftime('%d %b %Y')
      end

      def extract_date(tag)
        tag.css('.date-display-range').first.content.split(' –')
      end
    end
  end
end
