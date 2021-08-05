class Continent < ApplicationRecord
    has_many :cities
    has_one_attached :image

end
