$LOAD_PATH << (File.dirname(__FILE__))

require 'bundler'

Bundler.setup

require 'angus'
require 'services/timezone'

run Timezone.new