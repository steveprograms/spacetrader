require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'new game creation' do
    it 'should have a player' do
      user = User.create(email: "a@gmail.com", password: "monkey1")
      game = Game.create(user: user)
      expect(game.player).to be_present
    end

    it 'should have 10 planets' do
      user = User.create(email: "a@gmail.com", password: "monkey1")
      game = Game.create(user: user)
      expect(game.planets.length).to eq(10)
    end
  end

  it 'should have a planet named Rust' do
    user = User.create(email: "a@gmail.com", password: "monkey1")
    game = Game.create(user: user)
    expect(game.planets.where(name: "Rust").length).to eq(1)
  end
end