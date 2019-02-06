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
    feed = reader.call(data)
    parser = PARSERS.find{ |parser| parser.can_call?(feed) }
    body = parser.body(feed)
    head= parser.head(feed)
    handler = HANDLERS.find{ |handler| handler.can_call?(options) }
    new_body = handler.call(body)
    Converter.call(head,new_body,options[:reader])
  end
end
