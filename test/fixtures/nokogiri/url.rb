# frozen_string_literal: true

require 'nokogiri'

class Url
  def self.nokogiri_read(sourse)
    Nokogiri::XML(open(sourse))
  end
end
