require 'rails_helper'

RSpec.describe Player, type: :model do
  context '#buy_item' do
    it 'should increase bananas in hold by 1' do
      user = User.create(email: "a@gmail.com", password: "monkey1")
      game = Game.create(user: user)
      player = Player.create(game: game)
      ship = Ship.create(player: player)
      hold = Hold.create(ship: ship)
      player.credits = 1000
      player.buy_item("bananas", 30)
      player.save
      expect(hold.items.select{ |item| item.name == "bananas"}.length).to eq(1)
    end

    it 'should decrease credits by 30' do
      user = User.create(email: "a@gmail.com", password: "monkey1")
      game = Game.create(user: user)
      player = Player.create(game: game)
      ship = Ship.create(player: player)
      hold = Hold.create(ship: ship)
      player.credits = 1000
      player.buy_item("bananas", 30)
      player.save
      expect(player.credits).to eq(970)
    end
  end

  context '#sell_item' do
    it 'should decrease bananas in hold by 1' do
      user = User.create(email: "a@gmail.com", password: "monkey1")
      game = Game.create(user: user)
      player = Player.create(game: game)
      ship = Ship.create(player: player)
      hold = Hold.create(ship: ship)
      item = Item.create(name: "bananas")
      hold.items << item
      hold.save
      player.credits = 1000
      player.sell_item("bananas", 30)
      hold.save
      hold.reload
      player.save
      expect(hold.items.select{ |item| item.name == "bananas"}.length).to eq(0)
    end

    it 'should decrease credits by 30' do
      user = User.create(email: "a@gmail.com", password: "monkey1")
      game = Game.create(user: user)
      player = Player.create(game: game)
      ship = Ship.create(player: player)
      hold = Hold.create(ship: ship)
      item = Item.create(name: "bananas")
      hold.items << item
      player.credits = 1000
      player.sell_item("bananas", 30)
      player.save
      expect(player.credits).to eq(1030)
    end
  end
end
