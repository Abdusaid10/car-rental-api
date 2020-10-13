require 'rails_helper'

RSpec.describe Manufacturer, :type => :model do
  it { should have_many(:cars) }
  it { should have_many(:categories) }

  describe 'Manufacturer create action' do
    it 'attaches the image file' do
      file = fixture_file_upload(Rails.root.join('public', 'audi.jpg'), 'image/jpg')
      logo = fixture_file_upload(Rails.root.join('public', 'audi_logo.png'), 'image/png')
      expect {
        manufacturer :create, params: { manufacturer: { manufacturer: 'audi', about: 'about audi smth', image: file, logo: logo } }
      }.to change(ActiveStorage::Attachment, :count).by(2)
    end
  end
end