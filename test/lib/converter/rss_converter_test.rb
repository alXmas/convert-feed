# frozen_string_literal: true

require_relative '../../test_helper'

class RssConverterTest < Minitest::Test
  def test_in_rss_out_atom
    options = { handlers: {}, reader: 'atom' }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal out.xpath('/rss').present?, false
  end

  def test_in_rss_out_rss
    options = { handlers: {}, reader: 'rss' }
    feed = 'test/fixtures/rss'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert out.xpath('/rss').present?
  end
end
