# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

module UrlReader
  def self.can_call?(source)
    open(source).status == %w[200 OK]
  rescue StandardError
    false
  end

  def self.call(source)
    Nokogiri::XML(open(source))
  rescue StandardError
    puts 'Cant read input URL'
  end
end
