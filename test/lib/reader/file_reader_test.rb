# frozen_string_literal: true

require_relative '../../test_helper'

class FileReaderTest < Minitest::Test
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
end
