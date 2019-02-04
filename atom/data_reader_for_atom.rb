# frozen_string_literal: true

require 'active_support/core_ext/hash/conversions'

class DataReaderForAtom
  def call(options, feed)
    array = []
    feed.xpath('//xmlns:entry').each { |elem| array << elem }
    date = array.map { |element| Hash.from_xml(element.to_s) }

    if options[:reader] == 'atom'
      if options[:sort] == true
        sort_date = SortForAtom.call(date)
        AtomBuilderForAtom.build(sort_date, feed)
      elsif options[:reverse] == true
        reverse_date = Reverse.call(date)
        AtomBuilderForAtom.build(reverse_date, feed)
      else
        AtomBuilderForAtom.build(date, feed)
      end
    end

    if options[:reader] == 'rss'
      if options[:sort] == true
        sort_date = SortForAtom.call(date)
        RssBuilderForAtom.build(sort_date, feed)
      elsif options[:reverse] == true
        reverse_date = Reverse.call(date)
        RssBuilderForAtom.build(reverse_date, feed)
      else
        RssBuilderForAtom.build(date, feed)
      end
    end
  end
end
