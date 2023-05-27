class List < ApplicationRecord
  has_one_attached :photo

  has_many :bookmarks, dependent: :destroy
  # On lie la table à movie (liaison many to many)
  has_many :movies, through: :bookmarks
  # On lie la table à review
  has_many :reviews, dependent: :destroy
  # une liste doit avoir un nom, et pas de blanc
  validates :name, uniqueness: true, presence: true, allow_blank: false
end
