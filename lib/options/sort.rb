module Sort
  def self.option(options = {})
    options.has_key?(:sort)
  end

  def self.call(hash)
    hash.sort! do |first_item, second_item|
      first_item['DataTime'] <=> second_item['DataTime']
    end
  end
end