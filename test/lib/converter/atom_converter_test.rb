# frozen_string_literal: true

require_relative '../../test_helper'

class AtomConverterTest < Minitest::Test
  def test_in_atom_out_rss
    options = { handlers: {}, reader: 'rss' }
    feed = 'test/fixtures/atom'
    Dispatcher.run(options, feed)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert out.xpath('/rss').present?
  end

  def test_in_atom_out_atom
    options = { reader: 'atom', handlers: {} }
    source = 'test/fixtures/atom'
    Dispatcher.run(options, source)
    out = File.open('output') { |f| Nokogiri::XML(f) }
    assert_equal false, out.xpath('/rss').present?
  end
end
