require 'active_support/core_ext/hash/conversions'

class DataReaderForRss
  def call(options, feed)
    array = []
    feed.xpath('//item').each { |elem| array << elem }
    date = array.map { |element| Hash.from_xml(element.to_s) }

    if options[:reader] == 'atom'
      if (options[:sort] == true && options[:reverse] == true) || options[:sort] == true
        sort_date = SortForRss.call(date)
        AtomBuilderForRss.builder(sort_date, feed)
      elsif options[:reverse] == true
        reverse_date = Reverse.call(date)
        AtomBuilderForRss.builder(reverse_date, feed)
      else
        AtomBuilderForRss.builder(date,feed)
      end
    end

    if options[:reader] == 'rss'
      if (options[:sort] == true && options[:reverse] == true) || options[:sort] == true
        sort_date = SortForRss.call(date)
        RssBuilderForRss.builder(sort_date, feed)
      elsif options[:reverse] == true
        reverse_date = Reverse.call(date)
        RssBuilderForRss.builder(reverse_date, feed)
      else
        RssBuilderForRss.builder(date,feed)
      end
    end
  end
end