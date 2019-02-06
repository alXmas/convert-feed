require "rss"

module Converter
  def self.call(head, body, version)
    xml = RSS::Maker.make(version) do |maker|
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
    puts xml
    File.open('output', 'w') { |file| file.write(xml) }
  rescue
    puts 'Cant write to output file'
  end
end