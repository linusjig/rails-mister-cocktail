class Cocktail < ActiveRecord::Base
  # inverse_of saves first the cocktail and then creates the dose, otherewise it
  # tries to create the dose before the cocktail, and because there is no cocktail id
  # it doesn't save
  has_many :doses, dependent: :destroy, inverse_of: :cocktail
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :doses
  mount_uploader :photo, PhotoUploader
end
