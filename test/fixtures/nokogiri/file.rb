require 'nokogiri'

class File
  def self.read(sourse)
    File.open(sourse) { |f| Nokogiri::XML(f) }
  end
end