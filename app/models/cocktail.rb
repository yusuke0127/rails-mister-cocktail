class Cocktail < ApplicationRecord
  # associations
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  # validations
  validates :name, presence: true, uniqueness: true
end
