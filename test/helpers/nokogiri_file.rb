# frozen_string_literal: true

require 'nokogiri'

class NokogiriFile
  def self.read(sourse)
    File.open(sourse) { |f| Nokogiri::XML(f) }
  end
end
