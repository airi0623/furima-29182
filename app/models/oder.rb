class Oder < ApplicationRecord
  belongs_to   :users
  belongs_to   :items
  #has_one      :addresses
end
