# frozen_string_literal: true

require_relative 'test_helper'

class ConvertFeedTest < Minitest::Test
  def test_rss_file_reader
    rss_sourse = 'test/fixtures/rss'
    rss_feed = File.open(rss_sourse) { |f| Nokogiri::XML(f) }
    rss_file = FileReader.read(rss_sourse)
    assert_equal rss_feed.text, rss_file.text
  end

  def test_atom_file_reader
    atom_sourse = 'test/fixtures/atom'
    atom_feed = File.open(atom_sourse) { |f| Nokogiri::XML(f) }
    atom_file = FileReader.read(atom_sourse)
    assert_equal atom_feed.text, atom_file.text
  end

  def test_url_reader
    rss_sourse = 'https://ru.hexlet.io/lessons.rss'
    rss_url = Nokogiri::XML(open(rss_sourse))
    rss_link = UrlReader.read(rss_sourse)
    assert_equal rss_url.text, rss_link.text
  end

  def test_reverse
    data = [{ 'firstname' => 'Mark',
              'lastname' => 'Martin',
              'age' => '24',
              'gender' => 'M' }]
    data_reverse = Reverse.call(data)
    assert_equal data.reverse!, data_reverse
  end

  def test_sort_atom
    atom = [{ 'entry' => { 'title' => 'Firsr title',
                           'updated' => 'Thu, 05 Mar 2015 14:56:47 +0000' } },
            { 'entry' => { 'title' => 'Second title',
                           'updated' => 'Wed, 25 Mar 2015 12:05:14 +0000' } },
            { 'entry' => { 'title' => 'Third',
                           'updated' => 'Thu, 03 Jan 2019 09:37:13 +0000' } }]
    atom_sort = SortForAtom.call(atom)
    sort_date = atom.sort! do |first_item, second_item|
      first_item['entry']['updated'] <=> second_item['entry']['updated']
    end
    assert_equal sort_date, atom_sort
  end

  def test_sort_rss
    rss = [{ 'item' => { 'title' => 'Firsr title',
                         'pubDate' => 'Thu, 05 Mar 2015 14:56:47 +0000' } },
           { 'item' => { 'title' => 'Second title',
                         'pubDate' => 'Wed, 25 Mar 2015 12:05:14 +0000' } },
           { 'item' => { 'title' => 'Third',
                         'pubDate' => 'Thu, 03 Jan 2019 09:37:13 +0000' } }]
    rss_sort = SortForRss.call(rss)
    sort_date = rss.sort! do |first_item, second_item|
      first_item['item']['pubDate'] <=> second_item['item']['pubDate']
    end
    assert_equal sort_date, rss_sort
  end

  def test_in_rss_out_atom
    options = { reader: 'atom' }
    feed = FileReader.read('test/fixtures/rss')
    DataReaderForRss.new.call(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, false
  end

  def test_in_rss_out_rss
    options = { reader: 'rss' }
    feed = FileReader.read('test/fixtures/rss')
    DataReaderForRss.new.call(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, true
  end

  def test_in_atom_out_rss
    options = { reader: 'rss' }
    feed = FileReader.read('test/fixtures/atom')
    DataReaderForAtom.new.call(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, true
  end

  def test_in_atom_out_atom
    options = { reader: 'atom' }
    feed = FileReader.read('test/fixtures/atom')
    DataReaderForAtom.new.call(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, false
  end

  def test_flag_reverse_atom
    options = { reverse: true, reader: 'atom' }
    result = File.read('test/fixtures/option/reverse_atom')
    feed = UrlReader.read('https://ru.hexlet.io/lessons.rss')
    DataReaderForRss.new.call(options, feed)
    out = File.read('output')
    assert_equal out, result
  end

  def test_flag_reverse_rss
    options = { reverse: true, reader: 'rss' }
    result = File.read('test/fixtures/option/reverse_rss')
    feed = UrlReader.read('https://ru.hexlet.io/lessons.rss')
    DataReaderForRss.new.call(options, feed)
    out = File.read('output')
    assert_equal out, result
  end

  def test_flag_sort_atom
    options = { sort: true, reader: 'atom' }
    result = File.read('test/fixtures/option/sort_atom')
      feed = UrlReader.read('https://ru.hexlet.io/lessons.rss')
    DataReaderForRss.new.call(options, feed)
    out = File.read('output')
    assert_equal out, result
  end

  def test_flag_sort_rss
    options = { sort: true, reader: 'rss' }
    result = File.read('test/fixtures/option/sort_rss')
    feed = UrlReader.read('https://ru.hexlet.io/lessons.rss')
    DataReaderForRss.new.call(options, feed)
    out = File.read('output')
    assert_equal out, result
  end
end
