# frozen_string_literal: true

require 'accommodation'
require 'user'

describe Accommodation do
  context '#initialize' do
    it 'sould have a title, description and a price' do
      flat = Accommodation.new(id: 679, title: 'New Flat', price: 110, description: 'New Swaggy flat', user_id: 20)
      expect(flat.price).to eq 110
    end
  end

  context '.all' do
    it 'lists all accommodations' do
      user = User.create(name: 'Jesus', username: 'Allah', email: 'god@email.com', password: 'passgod')
      loft = Accommodation.add(title: 'Lazy Loft', price: 100, description: 'It is lazy', user_id: user.id)

      expect(Accommodation.all[0].title).to eq 'Lazy Loft'
      expect(Accommodation.all[0].price).to eq '100'
      expect(Accommodation.all[0].description).to eq 'It is lazy'
    end
  end

  context '.add' do
    it 'should add a new accommodation in the set of places to stay' do
      user = User.create(name: 'Jesus', username: 'Allah', email: 'god@email.com', password: 'passgod')
      title = 'House_1'
      description = 'This little house is the first one'
      price = 100
      expect { Accommodation.add(title: title, price: price, description: description, user_id: user.id) }.to change { Accommodation.all.length }.by 1
    end
  end

  context '.find' do
    it 'should return the requested accommodation' do
      user = User.create(name: 'Jesus', username: 'Allah', email: 'god@email.com', password: 'passgod')
      haunted_house = Accommodation.add(title: 'haunted', price: 600, description: 'It is scary', user_id: user.id)
      return_this_house = Accommodation.find(id: haunted_house.id)
      expect(return_this_house.title).to eq 'haunted'
    end
  end
end
