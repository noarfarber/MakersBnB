require "booking"

describe Booking do
  context ".all" do
    it "should return a list of all bookings" do
      user = User.create(name: "Jesus", username: "Allah", email: "god@email.com", password: "passgod")
      loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy", user_id: user.id)
      another_user = User.create(name: "Black Jesus", username: "His Airness", email: "jordan@bulls.com", password: "the_goat")
      mansion_booking = Booking.create(date: "23/04/2001", host_id: loft.id, tenant_id: another_user.id)
      expect(Booking.all[0].date).to eq "2001-04-23"
      expect(Booking.all[0].host_id).to eq loft.id
      expect(Booking.all[0].tenant_id).to eq another_user.id
    end
  end

  context ".create" do
    it "should create a booking" do
      user = User.create(name: "Jesus", username: "Asagdfdah", email: "god@email.com", password: "passgod")
      loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy", user_id: user.id)
      another_user = User.create(name: "Black Jesus", username: "His Airness", email: "jordan@bulls.com", password: "the_goat")
      expect { Booking.create(date: "23/05/2021", host_id: loft.id, tenant_id: another_user.id) }.to change { Booking.all.length }.by 1
    end
  end

  context ".find" do
    it "should be able to find a Booking on its ID" do
      user = User.create(name: "Jesus", username: "Asagdfdah", email: "god@email.com", password: "passgod")
      loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy", user_id: user.id)
      another_user = User.create(name: "Black Jesus", username: "His Airness", email: "jordan@bulls.com", password: "the_goat")
      bookin = Booking.create(date: "23/05/2021", host_id: loft.id, tenant_id: another_user.id)
      expect(Booking.find(id: bookin.id).host_id).to eq loft.id
      expect(Booking.find(id: bookin.id).date).to eq "2021-05-23"
    end
  end

  context ".booked?" do
    it "should be able to find a Booking on its ID" do
      user = User.create(name: "Jesus", username: "Asagdfdah", email: "god@email.com", password: "passgod")
      loft = Accommodation.add(title: "Lazy Loft", price: 100, description: "It is lazy", user_id: user.id)
      another_user = User.create(name: "Black Jesus", username: "His Airness", email: "jordan@bulls.com", password: "the_goat")
      bookin = Booking.create(date: "23/05/2021", host_id: loft.id, tenant_id: another_user.id)
      expect(Booking.booked?(date: bookin.date)).to be_a Booking
      expect(Booking.booked?(date: "2021-10-10")).to be_nil
    end
  end
end
