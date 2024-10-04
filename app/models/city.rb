class City < ApplicationRecord
  has_many :communes

  validates :name, presence: true
end
