class ContinentSerializers::DetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url
  has_many :countries, serializer: CountrySerializers::ListSerializer
end
