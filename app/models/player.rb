class Player < ApplicationRecord
  # Direct associations

  belongs_to :team

  belongs_to :user

  has_many   :tags,
             :class_name => "Tagging",
             :dependent => :destroy

  has_many   :notes,
             :class_name => "Comment",
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

  validates :my_rank, :numericality => { :greater_than => 0 }

  validates :name, :presence => true

end
