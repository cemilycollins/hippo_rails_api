class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :hospital_id, :user_id, :body, :rating, :date
end
