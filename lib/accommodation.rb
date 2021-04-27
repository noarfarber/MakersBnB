class Accommodation
  def initialize(id:, title:, price:, description: "")
    @id = id
    @title = title
    @price = price
    @description = description
  end

  def self.add(title:, price:, description:)
    new_space = DatabaseConnection.query("INSERT INTO accommodation(title, price, description) VALUES('#{title}', '#{price}', '#{description}')
        RETURNING id, title, price, description")
    Accommodation.new(id: new_space[0]["id"], title: new_space[0]["title"], price: new_space[0]["price"], description: new_space[0]["description"])
  end
end
