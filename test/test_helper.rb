# frozen_string_literal: true

require 'minitest/autorun'
Dir.glob('lib/**/*.rb') { |f| require(f) }
require_relative '../test/fixtures/nokogiri/nokogiri_url'
require_relative '../test/fixtures/nokogiri/nokogiri_file'
require_relative '../lib/dispatcher'
