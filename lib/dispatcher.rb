# frozen_string_literal: true

require 'require_all'
require_all 'lib/reader'
require_all 'lib/parser'
require_all 'lib/handler'
require_all 'lib/converter'

module Dispatcher
  READERS = Dir.children('lib/reader')
               .map { |x| File.basename(x, '.rb').classify.constantize }
  PARSERS = Dir.children('lib/parser')
               .map { |x| File.basename(x, '.rb').classify.constantize }
  CONVERTERS = Dir.children('lib/converter')
                  .map { |x| File.basename(x, '.rb').classify.constantize }

  def self.run(options, source)
    reader = READERS.find { |reader| reader.can_call?(source) }
    data = reader.nil? ? raise : reader.call(source)
    parser = PARSERS.find { |parser| parser.can_call?(data) }
    body = parser.body(data)
    head = parser.head(data)
    handlers = options[:handlers].keys
                                 .map { |type| type.to_s.classify.constantize }
    handlers.nil? ? body : handlers.each { |item| body = item.call(body) }
    converter = CONVERTERS.find { |converter| converter.can_call?(options) }
    converter.call(head: head, body: body)
  rescue StandardError
    puts 'Cant read this data'
  end
end
