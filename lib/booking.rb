require "pg"
require_relative "./database_connection"

class Booking
  attr_reader :id, :date, :host_id, :tenant_id

  def initialize(id:, date:, host_id:, tenant_id:)
    @id = id
    @date = date
    @host_id = host_id
    @tenant_id = tenant_id
  end

  def self.all
    all_booking = DatabaseConnection.query("SELECT * from bookings;")
    all_booking.map { |booking|
      Booking.new(id: booking["id"],
                  date: booking["date"],
                  host_id: booking["host_id"],
                  tenant_id: booking["tenant_id"])
    }
  end

  def self.create(date:, host_id:, tenant_id:)
    created_booking = DatabaseConnection.query("INSERT INTO bookings(date, host_id, tenant_id) 
    VALUES('#{Date.parse(date).strftime("%Y-%m-%d")}','#{host_id}','#{tenant_id}') RETURNING id, date, host_id, tenant_id")
    Booking.new(id: created_booking[0]["id"],
                date: created_booking[0]["date"],
                host_id: created_booking[0]["host_id"],
                tenant_id: created_booking[0]["tenant_id"])
  end

  def self.find(id:)
    find_booking = DatabaseConnection.query("SELECT * FROM bookings WHERE id = '#{id}'")
    Booking.new(id: find_booking[0]["id"],
                date: find_booking[0]["date"],
                host_id: find_booking[0]["host_id"],
                tenant_id: find_booking[0]["tenant_id"])
  end

  def self.booked?(date:)
    booked_acc = DatabaseConnection.query("SELECT * FROM bookings WHERE date = '#{date}'")
    unless booked_acc.none?
      return Booking.new(id: booked_acc[0]["id"],
                         date: booked_acc[0]["date"],
                         host_id: booked_acc[0]["host_id"],
                         tenant_id: booked_acc[0]["tenant_id"])
    end
  end
end
