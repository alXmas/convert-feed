# frozen_string_literal: true

require_relative '../../test_helper'

class SortTest < Minitest::Test
  def test_sort
    data = [{ 'title' => 'Firsr title',
              'data_time' => 'Thu, 01 Mar 2015 14:56:47 +0000' },
            { 'title' => 'Second title',
              'data_time' => 'Wed, 22 Mar 2015 12:05:14 +0000' },
            { 'title' => 'Third',
              'data_time' => 'Thu, 03 Mar 2019 09:37:13 +0000' }]
    sort = Sort.call(data)
    date = data.sort_by { |a| a['data_time'] }
    assert_equal date, sort
  end
end
