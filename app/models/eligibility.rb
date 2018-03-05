class Eligibility < ApplicationRecord
  # Direct associations

  belongs_to :position

  belongs_to :player

  # Indirect associations

  # Validations

end
