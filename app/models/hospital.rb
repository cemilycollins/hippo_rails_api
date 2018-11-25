class Hospital < ApplicationRecord
  has_many :reviews
  has_many :hospital_procedures
  has_many :procedures, through: :hospital_procedures

  validates :name, uniqueness: { scope: :zip_code}

  def rating_average
    arr = self.reviews.map do |r|
      r.rating
    end
    return arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

  def total_reviews
    self.reviews.size
  end

end
