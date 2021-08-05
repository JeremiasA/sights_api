class Icon < ApplicationRecord
    acts_as_paranoid
    
    has_many :icon_city, dependent: :destroy 
    has_many :cities, through: :icon_city
    has_one_attached :image

    attr_accessor :cities_ids

    validates :name, :image, :created, :height, :history, presence: true
    validates :height, numericality: { only_integer: true }
    validates :name, uniqueness: true, length: {maximum: 15}
    validates :history, length: {minimum: 15}

    delegate :url, to: :image, prefix: true

    def save_cities
        cities_array = cities_ids.split(",")
        cities_array.each do |city_id|
            IconCity.create(icon: self, city_id: city_id)
        end
    end

    def update_cities
        IconCity.where(icon_id: self.id).destroy_all
        self.save_cities
    end    
end
