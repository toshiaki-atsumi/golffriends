class Participant < ApplicationRecord
  belongs_to :schedule
  belongs_to :member
end
