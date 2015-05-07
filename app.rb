require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/actors'
require './lib/movies'
require 'pg'

DB = PG.connect(dbname: "showtime")


get('/') do
	@actors = Actor.all()
	@movies = Movie.all()
	erb(:index)
end

get('/actors') do
	@actors = Actor.all()
	erb(:actors)
end

get('/movies') do
	@movies = Movie.all()
	erb(:movies)
end

post('/actors') do
	name = params.fetch('actor')
  actor = Actor.new(name: name, id: nil)
	actor.save
	@actors = Actor.all()
	erb(:actors)
end

post('/movies') do
	name = params.fetch('movie')
	movie = Movie.new({:name => name, :id => nil})
	movie.save()
	@movies = Movie.all()
	erb(:movies)
end

get('/actors/:id') do
	@actor = Actor.find(params.fetch('id'))
	@movies = Movie.all()
	erb(:actor_info)
end

patch('/actors/:id') do
	actor_id = params.fetch('id')
	@actor = Actor.find(actor_id)
	movie_ids = params.fetch("movie_ids")
	@actor.update(movie_ids: movie_ids)
	@movies = Movie.all()
  erb(:actor_info)
end

get('/movies/:id') do
	@movie = Movie.find(params.fetch('id'))
	@actors = Actor.all()
	erb(:movie_info)
end

patch('/movies/:id') do
	movie_id = params.fetch('id')
	actor_ids = params.fetch('actor_ids')
	@movie = Movie.find(movie_id)
	@movie.update({:actor_ids => actor_ids})
	@actors = Actor.all()
	erb(:movie_info)
end

delete('/actors/:id') do
	actor_id = params.fetch('id')
	@actor = Actor.find(actor_id)
	movie_ids = params.fetch("movie_ids")
	@actor.delete(movie_ids: movie_ids)
	@movies = Movie.all()
	erb(:actor_info)
end
