test:
	ruby -I . -e "require 'minitest/autorun'; Dir.glob('test/**/*_test.rb') { |f| require(f) }"

.PHONY: test





