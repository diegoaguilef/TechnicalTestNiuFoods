class Device < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant

  has_many :updates

  enum status: { active: 0, maintenance: 1, warning: 2, error: 3 }
end
