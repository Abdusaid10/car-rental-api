require 'rails_helper'

RSpec.describe Category, :type => :model do
  it { should have_many(:cars).dependent(:destroy)}
end