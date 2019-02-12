# frozen_string_literal: true

require_relative 'concerns/converter'

module AtomConverter
  def self.can_call?(options)
    options[:reader] == 'atom'
  end

  def self.call(data = {})
    Converter.call(data, 'atom')
  end
end
