class Actor

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id =attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    actors = []
    returned_actors = DB.exec("SELECT * FROM actors ;")
    returned_actors.each() do |actor|
      id = actor.fetch('id').to_i()
      name = actor.fetch('name')
      actors.push(Actor.new(name: name, id: id))
    end
    actors
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO actors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end


  define_method(:==) do |another_actor|
    self.name().eql?(another_actor.name()) && self.id().eql?(another_actor.id())
  end

  define_singleton_method(:find) do |id|
    @id = id
    result = DB.exec("SELECT * FROM actors WHERE id = #{@id};")
    @name = result.first().fetch("name")
    Actor.new({:name => @name, :id => @id})
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE actors SET name = '#{@name}' WHERE id = #{self.id};")

    attributes.fetch(:movie_ids, []).each() do |movie_id|
      DB.exec("INSERT INTO movies_actors (actor_id, movie_id) VALUES (#{self.id}, #{movie_id}); ")
    end
  end

  define_method(:movies) do
    actor_movies = []
    results = DB.exec("SELECT movie_id FROM movies_actors WHERE actor_id = #{self.id}")
    results.each() do |results|
      movie_id = results.fetch('movie_id').to_i()
      movie = DB.exec("SELECT * FROM movies WHERE id = #{movie_id};")
      name = movie.first().fetch("name")
      actor_movies.push(Movie.new({:name => name, :id => movie_id}))
    end
    actor_movies
  end

  define_method(:delete) do
    DB.exec("DELETE FROM actors WHERE id = #{self.id()};")
    DB.exec("DELETE FROM movies_actors WHERE actor_id = #{self.id()};")
  end








end
