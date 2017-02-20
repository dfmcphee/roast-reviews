class Review < ApplicationRecord
  belongs_to :bean
  belongs_to :user
  validates :bean_id, uniqueness: { scope: :user_id, message: "You've already reviewed these beans." }
end
