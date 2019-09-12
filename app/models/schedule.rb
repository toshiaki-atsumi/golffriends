class Schedule < ApplicationRecord
  belongs_to :party
  serialize :mark
  has_many :participants,dependent: :destroy
end
