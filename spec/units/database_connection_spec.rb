# frozen_string_literal: true

require './lib/database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a database connection using PG' do
      db = 'makersBnB_test'
      described_class.setup(db)
      expect(DatabaseConnection.db).to be_a PG::Connection
    end

    it 'persists the database connection' do
      connection = DatabaseConnection.setup('makersBnB_test')
      expect(DatabaseConnection.db).to eq connection
    end
  end

  describe '.query(sql)' do
    it 'executes a given SQL query using PG' do
      connection = DatabaseConnection.setup('makersBnB_test')
      sql = 'SELECT * FROM accommodation;'

      expect(connection).to receive(:exec).with(sql)
      DatabaseConnection.query(sql)
    end
  end
end
