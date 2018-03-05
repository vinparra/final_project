class Position < ApplicationRecord
  # Direct associations

  has_many   :eligibilities,
             :dependent => :destroy

  # Indirect associations

  has_many   :players,
             :through => :eligibilities,
             :source => :player

  # Validations

end
