class Rank < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :player

  # Indirect associations

  # Validations

end
