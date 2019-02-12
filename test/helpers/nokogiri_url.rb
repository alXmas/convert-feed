# frozen_string_literal: true

require 'nokogiri'

class NokogiriUrl
  def self.read(sourse)
    Nokogiri::XML(open(sourse))
  end
end
