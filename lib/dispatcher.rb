require_relative '../lib/reader/file_reader'
require_relative '../lib/reader/url_reader'
require_relative '../lib/mutator/atom'
require_relative '../lib/mutator/rss'


module Dispatcher
  READERS = [FileReader, UrlReader]
  MUTATORS = [Atom, Rss]
  # CONVERTORS =
  def self.run(options, data)
    reader = READERS.find{ |reader| reader.can_read?(data) }
    feed = reader.read(data)
    mutator = MUTATORS.find{ |mutator| mutator.can_call?(feed) }
    mutator.call(feed)
  end
end

