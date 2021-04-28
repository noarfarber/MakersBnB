require "accommodation"

describe Accommodation do
  context "#initialize" do
    it "sould have a title, description and a price" do
      flat = Accommodation.new(id: 679, title: "New Flat", price: 110, description: "New Swaggy flat", user_id: 20)
      expect(flat.price).to eq 110
    end
  end

  context ".all" do
    it "lists all accommodations" do
      loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy")

      expect(Accommodation.all[0].title).to eq "Lazy Loft"
      expect(Accommodation.all[0].price).to eq "100"
      expect(Accommodation.all[0].description).to eq "It is lazy"
    end
  end

  context ".add" do
    it "should add a new accommodation in the set of places to stay" do
      title = "House_1"
      description = "This little house is the first one"
      price = 100
      expect { Accommodation.add(title: title, price: price, description: description) }.to change { Accommodation.all.length }.by 1
    end
  end

  context ".find" do
    it "should return the requested accommodation" do
      haunted_house = Accommodation.add(title: "haunted", price: 600, description: "It is scary")
      return_this_house = Accommodation.find(id: haunted_house.id)
      expect(return_this_house.title).to eq "haunted" 
    end
  end 
end
