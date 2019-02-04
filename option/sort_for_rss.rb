# frozen_string_literal: true

class SortForRss
  def self.call(date)
    sort_date = date.sort! do |first_item, second_item|
      first_item['item']['pubDate'] <=> second_item['item']['pubDate']
    end
    sort_date
  end
end
