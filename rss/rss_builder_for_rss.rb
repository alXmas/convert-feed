require "rss"

class RssBuilderForRss
  def self.builder(date, feed)
    rss = RSS::Maker.make("2.0") do |maker|
      maker.channel.title = feed.xpath('//title').first.text
      maker.channel.link = feed.xpath('//link').first.text
      maker.channel.description = feed.xpath('//description').first.text
      date.each do |elem|
        maker.items.new_item do |item|
          item.link = elem['item']['link']
          item.title = elem['item']['title']
          item.updated = elem['item']['pubDate']
          item.description = elem['item']['description']
        end
      end
    end
    File.open('output', 'w') { |file| file.write(rss) }
    puts rss
  end
end