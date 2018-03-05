class Player < ApplicationRecord
  # Direct associations

  has_many   :historicals,
             :dependent => :destroy

  has_many   :eligibilities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
