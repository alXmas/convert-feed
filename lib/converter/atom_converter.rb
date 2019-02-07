# frozen_string_literal: true

require 'rss'

module AtomConverter
  def self.can_call?(options)
    options[:reader] == 'atom'
  end

  def self.call(head, body)
    atom = RSS::Maker.make('atom') do |maker|
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
    puts atom
    File.open('output', 'w') { |file| file.write(atom) }
  end
end
