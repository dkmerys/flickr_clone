require 'factory_bot_rails'
# class Test::Unit::TestCase
#   include
#    FactoryBot::Syntax::Methods
# end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end