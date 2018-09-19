class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :city, :state, :profile_pic, :type_of
  has_many :reviews
end
