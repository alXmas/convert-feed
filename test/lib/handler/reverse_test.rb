# frozen_string_literal: true

require_relative '../../test_helper'

class ReverseTest < Minitest::Test
  def test_reverse
    data = [{ 'firstname' => 'Mark',
              'lastname' => 'Martin',
              'age' => '24',
              'gender' => 'M' }]
    data_reverse = Reverse.call(data)
    assert_equal data.reverse, data_reverse
  end
end
