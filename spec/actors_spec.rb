require 'spec_helper'



describe(Actor) do
  describe("#name") do
    it('returns the name of an actor') do
      test_actor = Actor.new(name: "Brad Pitt", id: nil)
      expect(test_actor.name()).to(eq("Brad Pitt"))
    end
  end

  describe('#id') do
    it('returns the ID of actor') do
      test_actor = Actor.new(:name => "Brad Pitt", :id => 1)
      expect(test_actor.id()).to(eq(1))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Actor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an actor to list of actors') do
      test_actor = Actor.new(:name => "Brad Pitt", :id => nil)
      test_actor.save()
      expect(Actor.all()).to(eq([test_actor]))
    end
  end

  describe('#==') do
    it('ascribes equal to two objects are equal to each others') do
      test_actor = Actor.new({:name => "brad Pitt", :id => nil})
      test_actor2 = Actor.new({:name => "brad Pitt", :id => nil})
      expect(test_actor).to(eq(test_actor2))
     end
   end

   describe('.find') do
     it("returns an actor by its id") do
       test_actor = Actor.new({:name => "brad Pitt", :id => nil})
       test_actor.save()
       test_actor2 = Actor.new({:name => "brad Pitt", :id => nil})
       test_actor2.save()
       expect(Actor.find(test_actor2.id())).to(eq(test_actor2))
     end
   end

   describe('#update') do
     it('lets you update actors in the database') do
       actor = Actor.new({:name => "George Clooney", :id => nil})
       actor.save()
       actor.update({:name => "Brad Pitt"})
       expect(actor.name()).to(eq("Brad Pitt"))
     end


     it('lets you add a movie to an actor') do
      movie = Movie.new({:name => "Oceans Twelve", :id => nil})
      movie.save()
      actor = Actor.new({:name => "George Clooney", :id => nil})
      actor.save()
      actor.update({:movie_ids => [movie.id]})
      expect(actor.movies()).to(eq([movie]))
    end
  end

  describe('#movies') do
    it('returns all the movies a particular actor hasbeen in') do
       movie = Movie.new({:name => "Oceans Eleven", :id => nil})
       movie.save()
       movie2 = Movie.new({:name => "Oceans Twelve", :id => nil})
       movie2.save()
       actor = Actor.new({:name => "George Clooney", :id => nil})
       actor.save()
       actor.update({:movie_ids => [movie.id(), movie2.id()]})
       expect(actor.movies()).to(eq([movie, movie2]))
     end
   end

   describe('#delete') do
     it("lets you delete an actor from the database") do
      test_actor = Actor.new({:name => "brad Pitt", :id => nil})
      test_actor.save()
      test_actor2 = Actor.new({:name => "brad Pitt", :id => nil})
      test_actor2.save()
      test_actor.delete()
      expect(Actor.all()).to(eq([test_actor2]))
    end
  end


end
