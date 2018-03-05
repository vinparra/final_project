class Player < ApplicationRecord
  # Direct associations

  has_many   :notes,
             :dependent => :destroy

  has_many   :rankings,
             :dependent => :destroy

  has_many   :projections,
             :dependent => :destroy

  has_many   :historicals,
             :dependent => :destroy

  has_many   :eligibilities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
