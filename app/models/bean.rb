class Bean < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :roaster
  dragonfly_accessor :image

  def average_rating
    if !self.reviews.empty?
      self.reviews.average(:rating)
    else
      0
    end
  end

  def average_flavour(flavour)
    if !self.reviews.empty?
      self.reviews.average(flavour)
    else
      0
    end
  end
end
