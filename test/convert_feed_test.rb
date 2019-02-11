# frozen_string_literal: true

require_relative 'test_helper'

class ConvertFeedTest < Minitest::Test
  def test_reverse_rss
    options = { reader: 'rss', handlers: { reverse: true } }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    standard = File.open('test/fixtures/handler/reverse_rss') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('//item').text, standard.xpath('//item').text
  end

  def test_sort_rss
    options = { reader: 'rss', handlers: { sort: true } }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    standard = File.open('test/fixtures/handler/sort_rss') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('//item').text, standard.xpath('//item').text
  end

  def test_sort_atom
    options = { reader: 'atom', handlers: { sort: true } }
    feed = 'test/fixtures/atom'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    standard = File.open('test/fixtures/handler/sort_atom') { |f| Nokogiri::XML(f) }
    assert_equal standard.xpath('//xmlns:entry').text, out.xpath('//xmlns:entry').text
  end

  def test_reverse_atom
    options = { reader: 'atom', handlers: { reverse: true } }
    feed = 'test/fixtures/atom'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    standard = File.open('test/fixtures/handler/reverse_atom') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('//xmlns:entry').text, standard.xpath('//xmlns:entry').text
  end
end
