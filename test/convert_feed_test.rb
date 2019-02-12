# frozen_string_literal: true

require_relative 'test_helper'

class ConvertFeedTest < Minitest::Test
  def test_reverse_rss
    options = { reader: 'rss', handlers: { reverse: true } }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.nokogiri_read('output')
    standard = File.nokogiri_read('test/fixtures/handler/reverse_rss')
    assert_equal out.xpath('//item').text, standard.xpath('//item').text
  end

  def test_sort_rss
    options = { reader: 'rss', handlers: { sort: true } }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.nokogiri_read('output')
    standard = File.nokogiri_read('test/fixtures/handler/sort_rss')
    assert_equal out.xpath('//item').text, standard.xpath('//item').text
  end

  def test_sort_atom
    options = { reader: 'atom', handlers: { sort: true } }
    feed = 'test/fixtures/atom'
    Dispatcher.run(options, feed)
    out = File.nokogiri_read('output')
    standard = File.nokogiri_read('test/fixtures/handler/sort_atom')
    assert_equal standard.xpath('//xmlns:entry').text, out.xpath('//xmlns:entry').text
  end

  def test_reverse_atom
    options = { reader: 'atom', handlers: { reverse: true } }
    feed = 'test/fixtures/atom'
    Dispatcher.run(options, feed)
    out = File.nokogiri_read('output')
    standard = File.nokogiri_read('test/fixtures/handler/reverse_atom')
    assert_equal out.xpath('//xmlns:entry').text, standard.xpath('//xmlns:entry').text
  end
end
