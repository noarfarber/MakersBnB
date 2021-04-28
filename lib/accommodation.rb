require 'pg'
require_relative './database_connection'

class Accommodation
  attr_reader :id, :title, :price, :description, :user_id

  def initialize(id:, title:, price:, description:, user_id:)
    @id = id
    @title = title
    @price = price
    @description = description
    @user_id = user_id
  end

  def self.add(title:, price:, description:)
    new_space = DatabaseConnection.query("INSERT INTO accommodation(title, price, description) VALUES('#{title}', '#{price}', '#{description}')
        RETURNING id, title, price, description, user_id")
    Accommodation.new(id: new_space[0]["id"], title: new_space[0]["title"], price: new_space[0]["price"], description: new_space[0]["description"], user_id: new_space[0]["user_id"])
  end

  def self.all
    new_space = DatabaseConnection.query("SELECT * FROM accommodation;")
    new_space.map do |new_space|
      Accommodation.new(id: new_space['id'], title: new_space['title'], price: new_space['price'], description: new_space['description'], user_id: new_space['user_id'])
    end
  end

  def self.find(id:)
    new_space = DatabaseConnection.query("SELECT * FROM accommodation WHERE id = '#{id}';")
    Accommodation.new(id: new_space[0]["id"], title: new_space[0]["title"], price: new_space[0]["price"], description: new_space[0]["description"], user_id: new_space[0]["user_id"])
  end
end
