class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  # une liste doit avoir un nom, et pas de blanc
  validates :name, uniqueness: true, presence: true, allow_blank: false
end
