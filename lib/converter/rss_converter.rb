# frozen_string_literal: true

require 'rss'

module RssConverter
  def self.can_call?(options)
    options[:reader] == 'rss'
  end

  def self.call(head, body)
    rss = RSS::Maker.make('2.0') do |maker|
      maker.channel.title = head[0]['title']
      maker.channel.link = head[1]['link']
      maker.channel.description = 'description'
      maker.channel.id = head[1]['link']
      maker.channel.updated = Time.now.to_s
      maker.channel.author = 'author'
      body.each do |elem|
        maker.items.new_item do |item|
          item.title = elem['title']
          item.link = elem['link']
          item.updated = elem['DataTime']
          item.description = elem['Text']
        end
      end
    end
    puts rss
    File.open('output', 'w') { |file| file.write(rss) }
  end
end
