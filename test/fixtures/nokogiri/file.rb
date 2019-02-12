# frozen_string_literal: true

require 'nokogiri'

class File
  def self.nokogiri_read(sourse)
    File.open(sourse) { |f| Nokogiri::XML(f) }
  end
end
