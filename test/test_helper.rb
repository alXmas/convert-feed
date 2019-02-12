# frozen_string_literal: true

require 'minitest/autorun'
Dir.glob('lib/**/*.rb') { |f| require(f) }
require_relative '../test/fixtures/nokogiri/file'
require_relative '../../test/fixtures/nokogiri/url'
require_relative '../lib/dispatcher'
