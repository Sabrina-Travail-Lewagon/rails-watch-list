class Bookmark < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :list
  # Un commentaire doit faire au moins 6 caractères
  validates :comment, length: { minimum: 6 }
  # Pour valider qu'un signet (Bookmark) est unique pour un couple donné de film (Movie) et de liste (List),
  # on utilise la validation uniqueness avec une portée (scope) spécifique.
  validates :list_id, uniqueness: { scope: :movie_id, message: "est déjà associé à ce film dans la liste" }
end
