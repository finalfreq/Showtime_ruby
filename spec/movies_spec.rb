require 'spec_helper'

describe(Movie) do
  describe("#name") do
    it('gives the name of the movie') do
      movie = Movie.new(name: "rush hour", id: nil)
      expect(movie.name()).to(eq("rush hour"))
    end
  end

  describe("#id") do
    it("returns the id of the movie ") do
      movie = Movie.new(name: "rush hour", id: 1)
      expect(movie.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('saves movie to the database') do
      test_movie = Movie.new({ :name => 'Rush Hour', :id => nil})
      test_movie.save
      expect(Movie.all()).to(eq([test_movie]))
    end
  end

  describe('.all') do
    it('shows all movies saved to the database, it is blank a first') do
      expect(Movie.all).to(eq([]))
    end
  end

  describe('#==') do
    it('shows if two movies are the same') do
      test_movie = Movie.new({ :name => 'Rush Hour', :id => nil})
      test_movie1 = Movie.new({ :name => 'Rush Hour', :id => nil})
      expect(test_movie).to(eq(test_movie1))
    end
  end







end
