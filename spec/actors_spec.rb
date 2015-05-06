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

end
