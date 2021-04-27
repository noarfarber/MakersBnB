require "./lib/database_connection"

ENV["ENVIRONMENT"] == "test" ? DatabaseConnection.setup("makersBnB_test") : DatabaseConnection.setup("makersBnB")
