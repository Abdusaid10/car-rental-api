require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:cars).dependent(:destroy) }
  it { should have_many(:manufacturers) }
end