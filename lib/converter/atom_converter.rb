# frozen_string_literal: true

require_relative 'concerns/convert_helper'

module AtomConverter
  def self.can_call?(options)
    options[:reader] == 'atom'
  end

  def self.call(data = {})
    ConvertHelper.build_xml(data, 'atom')
  end
end
