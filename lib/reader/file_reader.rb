# frozen_string_literal: true

require 'nokogiri'

module FileReader
  def self.can_call?(source)
    File.file?(source)
  end

  def self.call(source)
    File.open(source) { |f| Nokogiri::XML(f) }
  end
end