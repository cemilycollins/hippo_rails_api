class Hospital < ApplicationRecord
  has_many :reviews

  def rating_average
    arr = self.reviews.map do |r|
      r.rating
    end
    return arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

end
