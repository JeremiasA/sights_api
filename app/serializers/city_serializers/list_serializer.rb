class CitySerializers::ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :habitants, :image_url
end
