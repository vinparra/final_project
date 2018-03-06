class Player < ApplicationRecord
  # Direct associations

  belongs_to :team

  belongs_to :user,
             :foreign_key => "owner_id"

  has_many   :ranks,
             :dependent => :destroy

  has_many   :taggings,
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

  has_many   :tags,
             :through => :taggings,
             :source => :tag

  has_many   :user_rankers,
             :through => :ranks,
             :source => :user

  has_many   :positions,
             :through => :eligibilities,
             :source => :position

  # Validations

  validates :name, :presence => true

end
