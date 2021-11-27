require 'factory_bot'

RSpec.configure do |config|
  config.formatter = :documentation
  config.include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions
end

