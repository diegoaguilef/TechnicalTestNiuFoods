class Commune < ApplicationRecord
  belongs_to :city

  validates_associated :city
  validates :name, presence: true
end
