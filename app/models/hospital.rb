class Hospital < ApplicationRecord
  has_many :reviews
  has_many :hospital_procedures
  has_many :procedures, through: :hospital_procedures

  validates :name, uniqueness: { scope: :zip_code}

  def rating_average
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT AVG(rating) FROM reviews WHERE hospital_id = #{self.id}")
    return results.rows[0][0]
    # arr = self.reviews.map do |r|
    #   r.rating
    # end
    # return arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

  def total_reviews
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT COUNT(id) FROM reviews WHERE hospital_id = #{self.id}")
    return results.rows[0][0]
  end

end
