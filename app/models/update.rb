class Update < ApplicationRecord
  belongs_to :device

  enum status: { active: 0, maintenance: 1, warning: 2, error: 3 }

  after_create :update_device_status

  private

  def update_device_status
    device.update(status: status) if device.status != status
  end
end
