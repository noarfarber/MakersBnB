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
    user_data = DatabaseConnection.query("SELECT * FROM users;")
    user_data.map do |user_data|
      User.new(id: user_data['id'], name: user_data['name'], username: user_data['username'], email: user_data['email'], password: user_data['password'])
    end
  end

  def self.create(name:, username:, password:, email:)
    new_user = DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}')
    RETURNING id, name, username, email, password")
    User.new(id: new_user[0]['id'], name: new_user[0]['name'], username: new_user[0]['username'], email: new_user[0]['email'], password: new_user[0]['password'])
  end
end