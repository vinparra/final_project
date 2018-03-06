class User < ApplicationRecord
  # Direct associations

  has_many   :ranks,
             :dependent => :destroy

  has_many   :players,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :ranked_players,
             :through => :ranks,
             :source => :player

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
