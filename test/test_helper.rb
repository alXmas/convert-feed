# frozen_string_literal: true

require 'minitest/autorun'
Dir.glob('lib/**/*.rb') { |f| require(f) }
require_relative '../lib/dispatcher'
