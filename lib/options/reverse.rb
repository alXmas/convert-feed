module Reverse
  def self.option(options = {})
    options.has_key?(:reverse)
  end

  def self.call(hash)
    hash.reverse
  end
end