class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :date_shipment

  belongs_to   :user
  has_one      :orders
  has_one_attached :image

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :item_name
    validates :detail
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_region_id
    validates :date_shipment_id 
    validates :price 
    validates :image
  end
    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :shipping_charge_id, numericality: { other_than: 1 } 
    validates :shipping_region_id, numericality: { other_than: 0 } 
    validates :date_shipment_id, numericality: { other_than: 1 } 
end
