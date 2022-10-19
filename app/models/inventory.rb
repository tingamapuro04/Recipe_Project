class Inventory < ApplicationRecord
  has_many :inventory_foods
  belongs_to :user

  validates :name, presence: true, length: { in: 0..80 }
end
