class HospitalSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average
  has_many :reviews


end
