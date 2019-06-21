class Party < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :president, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  has_secure_password
  has_many :registrations,dependent: :destroy
  has_many :requests,dependent: :destroy
end
