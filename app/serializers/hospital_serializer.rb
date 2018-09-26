class HospitalSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :latitude, :longitude, :city, :state, :zip_code, :rating_average, :phone, :provider_number
  has_many :reviews
  has_many :hospital_procedures


end
