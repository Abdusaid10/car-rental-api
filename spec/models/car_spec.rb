require 'rails_helper'

RSpec.describe Category, :type => :model do
  it { should belong_to(:category) }
  it { should belong_to(:manufacturer) }
end