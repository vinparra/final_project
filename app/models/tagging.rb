class Tagging < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :player

  # Indirect associations

  # Validations

end
