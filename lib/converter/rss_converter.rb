# frozen_string_literal: true

require_relative 'concerns/converter'
module RssConverter
  def self.can_call?(options)
    options[:reader] == 'rss'
  end

  def self.call(data = {})
    Converter.call(data, '2.0')
  end
end
