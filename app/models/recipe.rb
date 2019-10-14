class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  scope :favorited_by, -> (email) { joins(:favorites).where(favorites: { user: User.where(email: email) }) }
end
