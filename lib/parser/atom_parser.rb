require 'active_support/all'

module AtomParser
  def self.can_call?(feed)
    feed.xpath('//xmlns:entry').present?
  rescue
    false
  end

  def self.body(feed)
    body = []
    feed.xpath('//xmlns:entry').each { |elem| body << elem }
    body = body.map { |element| Hash.from_xml(element.to_s)['entry'] }
    body.each { |elem| elem['DataTime'] = elem.delete('updated') }
    body.each { |elem| elem['Text'] = elem.delete('summary') }
    body.each { |elem| elem['link'] = elem['link']['href']}
  rescue
    puts 'Cant parse body'
  end

  def self.head(feed)
    head = []
    head << feed.xpath('//xmlns:title').first
    head << "<link>#{feed.xpath('//xmlns:link').first['href']}</link>"
    head.map { |element| Hash.from_xml(element.to_s) }
  rescue
    puts 'Cant parse head'
  end
end