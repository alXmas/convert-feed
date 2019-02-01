require_relative 'test_helper'

class ConvertFeedTest < Minitest::Test
  def test_rss_file_reader
    rss_sourse = 'test/fixtures/reader/rss'
    rss_feed = File.open(rss_sourse) { |f| Nokogiri::XML(f) }
    rss_file = FileReader.read(rss_sourse)
    assert_equal rss_feed.text, rss_file.text
  end

  def test_atom_file_reader
    atom_sourse ='test/fixtures/reader/atom'
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
end