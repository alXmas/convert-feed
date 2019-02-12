# frozen_string_literal: true

require_relative '../../test_helper'

class UrlReaderTest < Minitest::Test
  def test_url_reader
    rss_sourse = 'https://ru.hexlet.io/lessons.rss'
    rss_url = NokogiriUrl.read(rss_sourse)
    rss_link = UrlReader.call(rss_sourse)
    assert_equal rss_url.text, rss_link.text
  end
end
