class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :date_shipment

  
  belongs_to   :user
  has_one      :order
  has_many_attached :images
  has_many :likes
  has_many :users, through: :likes
  # ここでカラム名が決まる アクティブハッシュの

  # すでにいいねしたかどうか」を判断するためのメソッド
  def liked_by?(user)
    likes.where(user_id: user).exists?
  end

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :item_name 
    validates :detail
    validates :category_id, format: {with: /\d/}
    validates :status_id, format: {with: /\d/}
    validates :shipping_charge_id, format: {with: /\d/}
    validates :shipping_region_id, format: {with: /\d/}
    validates :date_shipment_id, format: {with: /\d/}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は(¥300〜9,999,999)の範囲で入力してください"}
    validates :images
    validates :user_id
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1, message: "を選択してください" } 
    validates :status_id,  numericality: { other_than: 1, message: "を選択してください" } 
    validates :shipping_charge_id, numericality: { other_than: 1, message: "を選択してください" } 
    validates :shipping_region_id, numericality: { other_than: 0, message: "を選択してください" } 
    validates :date_shipment_id, numericality: { other_than: 1, message: "を選択してください" } 
  end
end