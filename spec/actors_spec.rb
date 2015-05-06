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

end
