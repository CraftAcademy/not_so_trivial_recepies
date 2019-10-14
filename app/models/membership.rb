class Membership < ApplicationRecord
  validates :title, presence: :true
end
