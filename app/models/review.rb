class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hospital

  def user_name
    self.user.name
  end

  def hospital_name
    self.hospital.name
  end
end
