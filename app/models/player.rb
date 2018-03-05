class Player < ApplicationRecord
  # Direct associations

  has_many   :eligibilities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
