# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

class UrlReader
  def self.read(source)
    Nokogiri::XML(open(source))
  end
end
