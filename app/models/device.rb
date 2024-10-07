class Device < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
  has_many :updates

  accepts_nested_attributes_for :updates, allow_destroy: true

  enum status: { active: 0, maintenance: 1, warning: 2, error: 3 }

  validates :name, presence: true
  validates :version, presence: true
  validates :status, inclusion: { in: %w[active maintenance warning error] }

  # Prevent duplicates
  def updates_attributes=(attributes)
    attributes.each do |update_attrs|
      # Find existing update by unique attributes
      existing_update = updates.find_by(id: update_attrs['id']) ||
        updates.find_by(version: update_attrs['version'])
      # Create a new update if no match found
      updates.build(update_attrs) unless existing_update
    end
  end
end
