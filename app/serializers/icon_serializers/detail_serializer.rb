class IconSerializers::DetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :height, :created, :history, :image_url
  has_many :cities, serializer: CitySerializers::ListSerializer
end
