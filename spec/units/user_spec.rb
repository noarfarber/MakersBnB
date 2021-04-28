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

  context '.find' do
    it 'finds a specific user' do
      noa = User.create(name: "Noa", username: "noatheboa", password: "noa123", email: "noa@gmail.com")
      return_noa = User.find(id: noa.id)
      expect(return_noa.name).to eq "Noa" 
    end
  end
end
