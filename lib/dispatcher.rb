require_relative '../lib/reader/file_reader'
require_relative '../lib/reader/url_reader'
require_relative '../lib/mutator/atom'
require_relative '../lib/mutator/rss'
require_relative '../lib/converter/atom'
require_relative '../lib/converter/rss'
require_relative '../lib/options/reverse'
require_relative '../lib/options/sort'


module Dispatcher
  READERS = [FileReader, UrlReader]
  MUTATORS = [Atom, Rss]
  OPTIONS = [Sort, Reverse]
  CONVERTORS = [Atom, Rss]

  def self.run(options, data)
    reader = READERS.find{ |reader| reader.can_read?(data) }
    feed = reader.read(data)
    mutator = MUTATORS.find{ |mutator| mutator.can_call?(feed) }
    hash = mutator.call(feed)
    option = OPTIONS.find{ |option| option.option(options) }
    option.call(feed, hash)
  end
end

