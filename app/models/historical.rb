class Historical < ApplicationRecord
  # Direct associations

  belongs_to :player

  # Indirect associations

  # Validations

  validates :at_bats, :numericality => { :greater_than_or_equal_to => 0 }

  validates :avg, :numericality => { :less_than_or_equal_to => 1, :greater_than_or_equal_to => 0 }

  validates :hits, :numericality => { :greater_than_or_equal_to => 0 }

  validates :home_runs, :numericality => { :greater_than_or_equal_to => 0 }

  validates :innings_pitched, :numericality => { :greater_than_or_equal_to => 0 }

  validates :on_base_percentage, :numericality => { :greater_than_or_equal_to => 0 }

  validates :on_base_plus_slugging, :numericality => { :greater_than_or_equal_to => 0 }

  validates :runs, :numericality => { :greater_than_or_equal_to => 0 }

  validates :runs_batted_in, :numericality => { :greater_than_or_equal_to => 0 }

  validates :saves, :numericality => { :greater_than_or_equal_to => 0 }

  validates :slugging_percentage, :numericality => { :greater_than_or_equal_to => 0 }

  validates :stolen_bases, :numericality => { :greater_than_or_equal_to => 0 }

  validates :strikeouts, :numericality => { :greater_than_or_equal_to => 0 }

  validates :wins, :numericality => { :greater_than_or_equal_to => 0 }

  validates :year, :uniqueness => { :scope => [:source, :player_id] }

  validates :year, :presence => true

  validates :year, :numericality => { :less_than => 2050, :greater_than => 1950 }

end
