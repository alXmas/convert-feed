# frozen_string_literal: true

require 'rubygems'
require 'atom'

class AtomBuilderForRss
  def self.build(data, feed)
    atom = Atom::Feed.new do |f|
      f.title = feed.xpath('//title').first.text
      f.links << Atom::Link.new(href: feed.xpath('//link').first.text)
      data.each do |item|
        f.entries << Atom::Entry.new do |e|
          e.title = item['item']['title']
          e.links << Atom::Link.new(href: item['item']['link'])
          e.updated = item['item']['pubDate']
          e.summary = item['item']['description']
        end
      end
    end
    File.open('output', 'w') { |file| file.write(atom.to_xml) }
    puts atom.to_xml
  end
end
