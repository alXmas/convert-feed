require_relative '../lib/reader/file_reader'
require_relative '../lib/reader/url_reader'
require_relative '../lib/parser/atom_parser'
require_relative '../lib/parser/rss_parser'
require_relative '../lib/converter/atom_converter'
require_relative '../lib/converter/rss_converter'
require_relative '../lib/handler/reverse'
require_relative '../lib/handler/sort'
require_relative 'converter'


module Dispatcher
  READERS = [FileReader, UrlReader]
  PARSERS = [AtomParser, RssParser]
  HANDLERS = [Sort, Reverse]
  # CONVERTERS = [AtomConverter, RssConverter]

  def self.run(options, data)
    reader = READERS.find{ |reader| reader.can_call?(data) }
    feed = reader.call(data)
    parser = PARSERS.find{ |parser| parser.can_call?(feed) }
    body = parser.body(feed)
    head= parser.head(feed)
    handler = HANDLERS.find{ |handler| handler.can_call?(options) }
    new_body = handler.call(body)
    # converter = CONVERTERS.find{ |converter| converter.can_call?(options) }
    version = Converter.can_call?(options)
    Converter.call(head,new_body,version)
  end
end
