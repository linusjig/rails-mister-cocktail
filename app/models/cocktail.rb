class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingridients, through: :doses
  validates :name, presence: true, uniqueness: true
end
