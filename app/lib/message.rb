class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end

  def self.car_created
    'Car created successfully'
  end

  def self.car_updated
    'Car updated successfully'
  end

  def self.car_destroyed
    'Car destroyed'
  end

  def self.manufacturer_created
    'Manufacturer created successfully'
  end

  def self.manufacturer_updated
    'Manufacturer updated successfully'
  end

  def self.manufacturer_destroyed
    'Manufacturer destroyed'
  end

  def self.category_created
    'Category created successfully'
  end

  def self.category_updated
    'Category updated successfully'
  end

  def self.category_destroyed
    'Category destroyed'
  end

  def self.booking_created
    'Car booked successfully'
  end

  def self.something_went_wrong
    'Something went wrong while creating'
  end
  
end