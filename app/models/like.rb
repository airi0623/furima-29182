class Like < ApplicationRecord
  has_many   :users
  has_many   :items
  validates_uniqueness_of :item_id, scope: :user_id
  # item_idとuser_idの組が1組しかないように(一人が一投稿にしかいいねできない)
end
