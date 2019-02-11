# frozen_string_literal: true

require 'active_support/all'

module RssParser
  def self.can_call?(feed)
    feed.xpath('/rss').present?
  end

  def self.body(data)
    body = []
    data.xpath('//item').each { |elem| body << elem }
    body = body.map { |element| Hash.from_xml(element.to_s)['item'] }
    body.each { |elem| elem['data_time'] = elem.delete('pubDate') }
    body.each { |elem| elem['Text'] = elem.delete('description') }
  rescue StandardError
    puts 'Cant parse body'
  end

  def self.head(data)
    head = []
    head << data.xpath('//title').first
    head << data.xpath('//link').first
    head.map { |element| Hash.from_xml(element.to_s) }
  rescue StandardError
    puts 'Cant parse head'
  end
end
