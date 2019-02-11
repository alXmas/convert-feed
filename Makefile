test:
	ruby -I . -e "Dir.glob('test/**/*_test.rb') { |f| require(f) }"

.PHONY: test





