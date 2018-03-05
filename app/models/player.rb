class Player < ApplicationRecord
  # Direct associations

  belongs_to :user

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

  has_many   :positions,
             :through => :eligibilities,
             :source => :position

  # Validations

end
