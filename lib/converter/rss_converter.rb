# frozen_string_literal: true

require_relative 'concerns/convert_helper'

module RssConverter
  def self.can_call?(options)
    options[:reader] == 'rss'
  end

  def self.call(data = {})
    ConvertHelper.build_xml(data, '2.0')
  end
end
