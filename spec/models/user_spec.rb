require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:bookings) }
  it { should have_many(:cars) }

  describe 'User valitation' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end
end
