# frozen_string_literal: true

require_relative '../lib/reader/file_reader'
require_relative '../lib/reader/url_reader'
require_relative '../lib/parser/rss_parser'
require_relative '../lib/parser/atom_parser'
require_relative '../lib/parser/rss_parser'
require_relative '../lib/handler/reverse'
require_relative '../lib/handler/sort'
require_relative '../lib/converter/atom_converter'
require_relative '../lib/converter/rss_converter'

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
