# frozen_string_literal: true

module Reverse
  def self.call(body)
    body.reverse
  rescue StandardError
    puts 'Cant reverse'
  end
end
