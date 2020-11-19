class Ingredient < ApplicationRecord
  has_many :doses
  
  validates :name, presence: true
  validates :name, uniqueness: true
end
