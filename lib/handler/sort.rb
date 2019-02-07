# frozen_string_literal: true

module Sort
  def self.call(body)
    body.sort_by { |a| a['DataTime'] }
  rescue StandardError
    puts 'Cant sort'
  end
end
