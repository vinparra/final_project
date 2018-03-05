class Team < ApplicationRecord
  # Direct associations

  has_many   :players,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
