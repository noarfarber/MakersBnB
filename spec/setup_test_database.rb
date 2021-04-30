# frozen_string_literal: true

require 'pg'

def setup_test_database
  conn = PG.connect(dbname: 'makersBnB_test')
  conn.exec('TRUNCATE TABLE accommodation, users, bookings;')
end
