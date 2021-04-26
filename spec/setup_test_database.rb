require "pg"

def setup_test_database
  conn = PG.connect(dbname: "placeholder_test")
  conn.exec("TRUNCATE TABLE ;")
end
