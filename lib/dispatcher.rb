require_relative '../lib/reader/file_reader'
require_relative '../lib/reader/url_reader'
require_relative '../lib/parser/rss_parser'
require_relative '../lib/parser/atom_parser'
require_relative '../lib/parser/rss_parser'
require_relative '../lib/handler/reverse'
require_relative '../lib/handler/sort'
require_relative 'converter'

module Dispatcher
  READERS = [FileReader, UrlReader]
  PARSERS = [AtomParser, RssParser]
  HANDLERS = [Sort, Reverse]

  def self.run(options, data)
    reader = READERS.find{ |reader| reader.can_call?(data) }
    feed = reader.nil? ? raise : reader.call(data)
    parser = PARSERS.find{ |parser| parser.can_call?(feed) }
    body = parser.body(feed)
    handler = HANDLERS.find{ |handler| handler.can_call?(options) }
    body = handler.nil? ? body : handler.call(body)
    Converter.call(parser.head(feed),body,options[:reader])
  rescue
    puts 'Cant read this data'
  end
end
