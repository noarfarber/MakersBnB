# frozen_string_literal: true

require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :name, :username, :password, :email

  def initialize(id:, name:, username:, password:, email:)
    @id = id
    @name = name
    @username = username
    @password = password
    @email = email
  end

  def self.all
    user_data = DatabaseConnection.query('SELECT * FROM users;')
    user_data.map do |user_data|
      User.new(id: user_data['id'],
               name: user_data['name'],
               username: user_data['username'],
               email: user_data['email'],
               password: user_data['password'])
    end
  end

  def self.create(name:, username:, password:, email:)
    encrypt_password = BCrypt::Password.create(password)
    new_user = DatabaseConnection.query("INSERT INTO users(name, username, email, password)
    VALUES('#{name}', '#{username}', '#{email}', '#{encrypt_password}')
    RETURNING id, name, username, email, password")
    User.new(
      id: new_user[0]['id'],
      name: new_user[0]['name'],
      username: new_user[0]['username'],
      email: new_user[0]['email'],
      password: new_user[0]['password']
    )
  end

  def self.find(id:)
    find_user = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: find_user[0]['id'],
             name: find_user[0]['name'],
             username: find_user[0]['username'],
             email: find_user[0]['email'],
             password: find_user[0]['password'])
  end

  def self.authenticate(username:, password:)
    get_user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")

    unless get_user.none? || BCrypt::Password.new(get_user[0]['password']) != password
      User.new(
        id: get_user[0]['id'],
        name: get_user[0]['name'],
        username: get_user[0]['username'],
        email: get_user[0]['email'],
        password: get_user[0]['password']
      )
    end
  end
end
