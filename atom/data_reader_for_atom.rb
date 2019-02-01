require 'active_support/core_ext/hash/conversions'

class DataReaderForAtom
  def call(options, feed)
    array = []
    feed.xpath('//xmlns:entry').each { |elem| array << elem }
    date = array.map { |element| Hash.from_xml(element.to_s) }

    if options[:reader] == 'atom'
      if (options[:sort] == true && options[:reverse] == true) || options[:sort] == true
        sort_date = SortForAtom.call(date)
        AtomBuilderForAtom.builder(sort_date, feed)
      elsif options[:reverse] == true
        reverse_date = Reverse.call(date)
        AtomBuilderForAtom.builder(reverse_date, feed)
      else
        AtomBuilderForAtom.builder(date,feed)
      end
    end

    if options[:reader] == 'rss'
      if (options[:sort] == true && options[:reverse] == true) || options[:sort] == true
        sort_date = SortForAtom.call(date)
        RssBuilderForAtom.builder(sort_date, feed)
      elsif options[:reverse] == true
        reverse_date = Reverse.call(date)
        RssBuilderForAtom.builder(reverse_date, feed)
      else
        RssBuilderForAtom.builder(date,feed)
      end
    end
  end
end