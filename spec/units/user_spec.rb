require "user"

describe User do
  context '.all' do 
    it 'lists all users instances' do
      Dom = User.create(name: "Dom", username: "Username", email: "Email", password: "Password")

      expect(User.all[0].name).to eq "Dom"
      expect(User.all[0].username).to eq "Username"
      expect(User.all[0].email).to eq "Email"
      expect(User.all[0].password).to eq "Password"
    end
  end
  
  context '.create' do
    it 'creates a new user' do
      expect { User.create(name: "Dom", username: "dommakers", email: "dom@makers.com", password: "password") }.to change { User.all.length }.by 1
    end
  end
end
