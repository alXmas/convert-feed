require 'active_support/all'

module Rss
  def self.can_call?(feed)
    feed.xpath('/rss').present?
  end

  def self.call(feed)
    array = []
    feed.xpath('//item').each { |elem| array << elem }
    data = array.map { |element| Hash.from_xml(element.to_s)['item'] }
    data.each { |elem| elem['DataTime'] = elem.delete('pubDate') }
  end
end