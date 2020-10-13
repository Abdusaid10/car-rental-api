class Car < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :category
  belongs_to :manufacturer

  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking

  has_one_attached :image
  # before_create :default_img

  def image_url
    url_for(image)
  end

  # private 
  #   def default_img
  #     if !image.attached? || image.nil?
  #       image.attach(io: File.open(Rails.root.join('public', 'img.png')), filename: 'img.png', content_type: 'image/*')
  #     end
  #   end
end
