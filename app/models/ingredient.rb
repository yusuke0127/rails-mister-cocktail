class Ingredient < ApplicationRecord
  # associations
  has_many :doses
  has_many :cocktails, through: :doses
  # validations
  validates :name, uniqueness: true, presence: true

end
