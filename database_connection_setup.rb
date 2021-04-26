require "./lib/database_connection"

ENV["ENVIRONMENT"] == "test" ? DatabaseConnection.setup("placeholder_test") : DatabaseConnection.setup("placeholder")
