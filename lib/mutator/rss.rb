require 'active_support/all'

module Rss
  def self.can_call?(feed)
    feed.xpath('/rss').present?
  end
  def self.call(feed)
    array = []
    feed.xpath('//item').each { |elem| array << elem }
    data = array.map { |element| Hash.from_xml(element.to_s) }
    data_time  = data.map { |item| item['item']['pubDate']}
  end
end
