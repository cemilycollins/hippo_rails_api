class Hospital < ApplicationRecord
  has_many :reviews
  has_many :hospital_procedures
  has_many :procedures, through: :hospital_procedures

  validates :name, uniqueness: { scope: :zip_code}

  def rating_average
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT AVG(rating) FROM reviews WHERE hospital_id = #{self.id}")
    self.rating_average = results.rows[0][0]
    self.save
    return results.rows[0][0]
  end

  def self.find_by_location(lat, lng)
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT * FROM hospitals WHERE latitude BETWEEN #{lat[0]} AND #{lat[1]} AND longitude BETWEEN #{lng[0]} AND #{lng[1]}")
    return results
  end

  def total_reviews
    @connection = ActiveRecord::Base.connection
    results = @connection.exec_query("SELECT COUNT(id) FROM reviews WHERE hospital_id = #{self.id}")
    self.total_reviews = results.rows[0][0]
    self.save
    return results.rows[0][0]
  end

end
