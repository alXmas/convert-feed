# frozen_string_literal: true

require_relative 'test_helper'

class ConvertFeedTest < Minitest::Test
  def test_rss_file_reader
    rss_sourse = 'test/fixtures/rss'
    rss_feed = File.open(rss_sourse) { |f| Nokogiri::XML(f) }
    rss_file = FileReader.call(rss_sourse)
    assert_equal rss_feed.text, rss_file.text
  end

  def test_atom_file_reader
    atom_sourse = 'test/fixtures/atom'
    atom_feed = File.open(atom_sourse) { |f| Nokogiri::XML(f) }
    atom_file = FileReader.call(atom_sourse)
    assert_equal atom_feed.text, atom_file.text
  end

  def test_url_reader
    rss_sourse = 'https://ru.hexlet.io/lessons.rss'
    rss_url = Nokogiri::XML(open(rss_sourse))
    rss_link = UrlReader.call(rss_sourse)
    assert_equal rss_url.text, rss_link.text
  end

  def test_reverse
    data = [{ 'firstname' => 'Mark',
              'lastname' => 'Martin',
              'age' => '24',
              'gender' => 'M' }]
    data_reverse = Reverse.call(data)
    assert_equal data.reverse, data_reverse
  end

  def test_sort
    data = [{ 'title' => 'Firsr title',
              'DataTime' => 'Thu, 05 Mar 2015 14:56:47 +0000' },
            { 'title' => 'Second title',
              'DataTime' => 'Wed, 25 Mar 2015 12:05:14 +0000' },
            { 'title' => 'Third',
              'DataTime' => 'Thu, 03 Jan 2019 09:37:13 +0000' }]
    sort = Sort.call(data)
    date = data.sort_by { |a| a['DataTime'] }
    assert_equal date, sort
  end

  def test_in_rss_out_atom
    options = { reader: 'atom' }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, false
  end

  def test_in_rss_out_rss
    options = { reader: 'rss' }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, true
  end

  def test_in_atom_out_rss
    options = { reader: 'rss' }
    feed = 'test/fixtures/atom'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, true
  end

  def test_in_atom_out_atom
    options = { reader: 'atom' }
    feed = 'test/fixtures/atom'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, false
  end
end
