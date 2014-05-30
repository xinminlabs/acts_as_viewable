require 'rspec'
require 'active_record'
require 'shoulda/matchers'
require 'acts_as_viewable'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"
load File.dirname(__FILE__) + '/support/schema.rb'

require 'support/models'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
