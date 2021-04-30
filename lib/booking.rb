# frozen_string_literal: true

require 'pg'
require_relative './database_connection'

class Booking
  attr_reader :id, :date, :host_id, :tenant_id

  def initialize(id:, date:, host_id:, tenant_id:)
    @id = id
    @date = date
    @host_id = host_id
    @tenant_id = tenant_id
  end

  def self.all
    all_booking = DatabaseConnection.query('SELECT * from bookings;')
    all_booking.map do |booking|
      Booking.new(id: booking['id'],
                  date: booking['date'],
                  host_id: booking['host_id'],
                  tenant_id: booking['tenant_id'])
    end
  end

  def self.create(date:, host_id:, tenant_id:)
    created_booking = DatabaseConnection.query("INSERT INTO bookings(date, host_id, tenant_id)
    VALUES('#{Date.parse(date).strftime('%Y-%m-%d')}','#{host_id}','#{tenant_id}') RETURNING id, date, host_id, tenant_id")
    Booking.new(id: created_booking[0]['id'],
                date: created_booking[0]['date'],
                host_id: created_booking[0]['host_id'],
                tenant_id: created_booking[0]['tenant_id'])
  end
end
