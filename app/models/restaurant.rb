class Restaurant < ApplicationRecord
  belongs_to :commune
  has_many :devices

  validates :name, presence: true
  validates :address, presence: true

  # return the status of the restaurant based on the status of its devices
  def status
    devices.map(&:status).max
  end
end
