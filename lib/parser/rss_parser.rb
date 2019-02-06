require 'active_support/all'

module RssParser
  def self.can_call?(feed)
    feed.xpath('/rss').present?
  end

  def self.body(feed)
    body = []
    feed.xpath('//item').each { |elem| body << elem }
    body = body.map { |element| Hash.from_xml(element.to_s)['item'] }
    body.each { |elem| elem['DataTime'] = elem.delete('pubDate') }
    body.each { |elem| elem['Text'] = elem.delete('description') }
  end

  def self.head(feed)
    head = []
    head << feed.xpath('//title').first
    head << feed.xpath('//link').first
    head.map { |element| Hash.from_xml(element.to_s) }
  end
end