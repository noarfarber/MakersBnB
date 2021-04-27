require "pg"

def setup_test_database
  conn = PG.connect(dbname: "makersBnB_test")
  conn.exec("TRUNCATE TABLE accommodation;")
end
