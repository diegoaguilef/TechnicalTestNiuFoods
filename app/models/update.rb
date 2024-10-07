class Update < ApplicationRecord
  belongs_to :device

  enum status: { active: 0, maintenance: 1, warning: 2, error: 3 }

  validates :status, inclusion: { in: %w[active maintenance warning error] }
  after_create :apply_device_update

  private

  def apply_device_update
    device.update(status: status, version: version)
  end
end
