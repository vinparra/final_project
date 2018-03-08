class Tag < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  has_many   :players,
             :through => :taggings,
             :source => :player

  # Validations

end
