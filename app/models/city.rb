class City < ApplicationRecord
    acts_as_paranoid
    
    belongs_to :continent
    has_many :icon_city, dependent: :destroy
    has_many :icons, through: :icon_city
    has_one_attached :image
    attr_accessor :icons_ids

    validates :name, :image, :habitants, :surface, presence: true
    validates :habitants, numericality: { only_integer: true }
    validates :surface, numericality: true
    validates :name, uniqueness: true, length: {maximum: 15}

    delegate :url, to: :image, prefix: true

    def save_icons
        icons_array = icons_ids.split(",")
        icons_array.each do |icon_id|
            IconCity.create(city: self, icon_id: icon_id)
        end
    end

    def update_icons
        IconCity.where(city_id: self.id).destroy_all
        self.save_icons
    end

end
