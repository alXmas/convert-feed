module Sort
  def self.can_call?(options = {})
    options.has_key?(:sort)
  end

  def self.call(body)
    body.sort do |first_item, second_item|
      first_item['DataTime'] <=> second_item['DataTime']
    end
  rescue
    puts 'Cant sort'
  end
end