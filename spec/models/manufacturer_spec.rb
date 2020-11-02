require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  it { should have_many(:cars).dependent(:destroy) }

  describe 'Manufacturer attachments' do
    it { should have_one_attached(:image) }
    it { should have_one_attached(:logo) }
  end
end
