class Roaster < ApplicationRecord
  has_many :beans, dependent: :destroy
end
