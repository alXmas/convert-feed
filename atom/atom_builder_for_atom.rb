# frozen_string_literal: true

require 'rubygems'
require 'atom'
require 'nokogiri'
require 'open-uri'

class AtomBuilderForAtom
  def self.build(data, feed)
    atom = Atom::Feed.new do |f|
      f.title = feed.xpath('xmlns|title').first
      f.links << Atom::Link.new(href: feed.xpath('xmlns|link').first)
      data.each do |item|
        f.entries << Atom::Entry.new do |e|
          e.title = item['entry']['title']
          e.links << Atom::Link.new(href: item['entry']['link'])
          e.updated = item['entry']['updated']
          e.summary = item['entry']['summary']
        end
      end
    end
    File.open('output', 'w') { |file| file.write(atom.to_xml) }
    puts atom.to_xml
  end
end
