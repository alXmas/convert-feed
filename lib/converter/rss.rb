module Atom
  def self.option(options = {})
    options[:out] == 'rss'
  end

  def self.call(feed, hash)
  end
end