require 'active_support/all'

module Atom
  def self.can_call?(feed)
    feed.xpath('//xmlns:entry').present?
  end

  def self.call(feed)
    array = []
    feed.xpath('//xmlns:entry').each { |elem| array << elem }
    data = array.map { |element| Hash.from_xml(element.to_s)['entry'] }
    data.each { |elem| elem['DataTime'] = elem.delete('updated') }
  end
end