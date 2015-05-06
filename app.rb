require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/actors.rb'
require './lib/movies.rb'
require 'pg'

DB = PG.connect(dbname: "showtime")
