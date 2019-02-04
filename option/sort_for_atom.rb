# frozen_string_literal: true

class SortForAtom
  def self.call(data)
    sort_data = data.sort! do |first_item, second_item|
      first_item['entry']['updated'] <=> second_item['entry']['updated']
    end
    sort_data
  end
end
