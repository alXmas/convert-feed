# frozen_string_literal: true
require 'require_all'
require_all 'lib/reader'
require_all 'lib/parser'
require_all 'lib/handler'
require_all 'lib/converter'


module Dispatcher
  READERS = [FileReader, UrlReader].freeze
  PARSERS = [AtomParser, RssParser].freeze
  CONVERTERS = [AtomConverter, RssConverter].freeze

  def self.run(options, data)
    handler = options.select { |_k, v| v == true }.keys
    reader = READERS.find { |reader| reader.can_call?(data) }
    feed = reader.nil? ? raise : reader.call(data)
    parser = PARSERS.find { |parser| parser.can_call?(feed) }
    body = parser.body(feed)
    handler.nil? ? body : handler.each { |item| body = item.call(body) }
    converter = CONVERTERS.find { |converter| converter.can_call?(options) }
    converter.call(parser.head(feed), body)
  rescue StandardError
    puts 'Cant read this data'
  end
end
