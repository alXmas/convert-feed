# frozen_string_literal: true

require 'nokogiri'

module FileReader
  def self.can_read?(source)
    File.file?(source)
  end

  def self.read(source)
    File.open(source) { |f| Nokogiri::XML(f) }
  end
end