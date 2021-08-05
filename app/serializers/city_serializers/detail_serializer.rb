class CitySerializers::DetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :habitants, :surface, :image_url
  has_one :continent, serializer: ContinentSerializers::DetailSerializer
  has_many :icons, serializer: IconSerializers::DetailSerializer
end
