require 'actors'
require 'movies'
require 'rspec'
require 'pg'
require 'pry'


DB = PG.connect(dbname: 'showtime_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM actors *;")
    DB.exec("DELETE FROM movies *;")
    DB.exec("DELETE FROM movies_actors *;")
  end
end
