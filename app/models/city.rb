class City < ApplicationRecord
  has_many :communes
  has_many :restaurants
end
