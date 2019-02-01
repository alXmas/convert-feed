class SortForAtom
  def self.call date
    sort_date = date.sort! do |first_item, second_item|
      first_item['entry']['updated'] <=> second_item['entry']['updated']
    end
    sort_date
  end
end
