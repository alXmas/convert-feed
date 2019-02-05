module Atom
  def self.option(options = {})
    options[:out] == 'atom'
  end

  def self.call(feed, hash)
  end
end