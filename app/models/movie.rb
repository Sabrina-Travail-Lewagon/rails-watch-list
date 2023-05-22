class Movie < ApplicationRecord
  has_many :bookmarks
  # # On lie la table à list (liaison many to many)
  has_many :lists, through: :bookmarks
  # Le titre est obligatoire, et unique
  validates :title, presence: true, uniqueness: true
  # L'overview obligatoire
  validates :overview, presence: true
end
