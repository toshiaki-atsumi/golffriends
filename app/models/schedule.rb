class Schedule < ApplicationRecord
  belongs_to :party
  serialize :mark
  
end
