module Reverse
  def self.can_call?(options = {})
    options.has_key?(:reverse)
  end

  def self.call(body)
    body.reverse
  rescue
    puts 'Cant reverse'
  end
end