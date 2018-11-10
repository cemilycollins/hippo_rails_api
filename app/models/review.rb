class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hospital

  validate :date_cannot_be_in_the_future

  def date_cannot_be_in_the_future
    if date > Date.today
      errors.add(:date, "Date can't be in the future")
    end
  end

  # def user_name
  #   self.user.name
  # end
  #
  # def hospital_name
  #   self.hospital.name
  # end
end
