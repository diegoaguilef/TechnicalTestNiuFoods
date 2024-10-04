class Restaurant < ApplicationRecord
  belongs_to :commune
  has_many :devices
end
