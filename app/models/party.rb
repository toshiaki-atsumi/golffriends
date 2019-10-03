class Party < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 },uniqueness: { case_sensitive: true }
  validates :president, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  has_secure_password
  has_many :requests,dependent: :destroy
  has_many :members
  has_many :members ,through: :requests,source: :party
  has_many :schedules,dependent: :destroy
end
