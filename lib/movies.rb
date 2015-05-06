class Movie

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO movies (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first()['id'].to_i
  end

  define_singleton_method(:all) do
    movies = []
    returned_movies = DB.exec("SELECT * FROM movies")
    returned_movies.each() do |movie|
      name = movie.fetch('name')
      id = movie.fetch('id').to_i()
      movies.push(Movie.new(name: name, id: id))
    end
    movies
  end

  define_method(:==) do |another_movie|
  self.name().==(another_movie.name()).&(self.id().==(another_movie.id()))
  end

end
