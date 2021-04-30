# frozen_string_literal: true

require 'user'
require 'bcrypt'
# Metrics/BlockLength: Block has too many lines.
describe User do
  context '.all' do
    it 'lists all users instances' do
      Dom = User.create(name: 'Dom', username: 'Username', email: 'Email', password: 'Password')

      expect(User.all[0].name).to eq 'Dom'
      expect(User.all[0].username).to eq 'Username'
      expect(User.all[0].email).to eq 'Email'
      expect(User.all[0].password).to eq BCrypt::Password.new(User.all[0].password)
    end
  end

  context '.create' do
    it 'creates a new user' do
      expect { User.create(name: 'Dom', username: 'dommakers', email: 'dom@makers.com', password: 'password') }.to change { User.all.length }.by 1
    end
  end

  context '.find' do
    it 'finds a specific user' do
      noa = User.create(name: 'Noa', username: 'noatheboa', password: 'noa123', email: 'noa@gmail.com')
      return_noa = User.find(id: noa.id)
      expect(return_noa.name).to eq 'Noa'
    end
  end

  context ".authenticate" do
    it "should return the user if the login is correct" do
      secret_user = User.create(name: "Team", username: "TooMuchSauce", password: "okthisisacorrectpassword", email: "tms@makers.com")
      auth_secret_user = User.authenticate(username: "TooMuchSauce", password: "okthisisacorrectpassword")
      expect(auth_secret_user.name).to eq "Team"
    end

    it 'should return nothing or nil if the username is incorrect' do
      TooMuchSauce = User.create(name: 'Team', username: 'TooMuchSauce', password: 'okthisisacorrectpassword', email: 'tms@makers.com')
      User.authenticate(username: 'NoSauce', password: 'okthisisacorrectpassword')
      expect(User.authenticate(username: 'NoSauce', password: 'okthisisacorrectpassword')).to be_nil
    end

    it "should return nothing if the password is incorrect" do
      nil_user = User.create(name: "Team", username: "TooMuchSauce", password: "okthisisacorrectpassword", email: "tms@makers.com")
      expect(User.authenticate(username: "TooMuchSauce", password: "notthegoodone")).to be_nil
    end
  end
end
