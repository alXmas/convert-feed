# frozen_string_literal: true

require 'rss'

class RssBuilderForAtom
  def self.build(date, feed)
    rss = RSS::Maker.make('2.0') do |maker|
      maker.channel.title = feed.xpath('//xmlns:title').first.content
      maker.channel.link = ''
      maker.channel.description = ''
      date.each do |elem|
        maker.items.new_item do |item|
          item.link = elem['entry']['link']
          item.title = elem['entry']['title']
          item.updated = elem['entry']['updated']
          item.description = elem['entry']['description']
        end
      end
    end
    File.open('output', 'w') { |file| file.write(rss) }
    puts rss
  end
end
