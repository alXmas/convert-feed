# frozen_string_literal: true

require 'nokogiri'

class Url
  def self.read(sourse)
    Nokogiri::XML(open(sourse))
  end
end
