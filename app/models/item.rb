class Item < ApplicationRecord
  belongs_to   :users
  has_one      :orders
  has_one_attached :image
  validates :content, presence: true, unless: :was_attached?
end
