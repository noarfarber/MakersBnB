# frozen_string_literal: true

require 'pg'

class DatabaseConnection
  def self.setup(db)
    @conn = PG.connect(dbname: db)
  end

  def self.db
    @conn
  end

  def self.query(sql)
    @conn.exec(sql)
  end
end
