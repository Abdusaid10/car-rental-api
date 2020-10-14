require 'rails_helper'

RSpec.describe Car, :type => :model do
  it { should belong_to(:category) }
  it { should belong_to(:manufacturer) }
  it { should have_one_attached(:image) }
end