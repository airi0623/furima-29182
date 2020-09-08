require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      # ユーザー定義    
      user = FactoryBot.create(:user) 
      @item = FactoryBot.build(:item, user_id: user.id)
      # -----------------
      @item.image = fixture_file_upload('public/images/test_image.png')
    end
    
    describe '商品の新規登録' do
      context '商品登録がうまくいくとき' do
        it "全ての項目が入力されていれば保存できること" do
          expect(@item).to be_valid
        end
      end

      context '商品登録がうまくいかない時' do
        it "画像がないと登録ができない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "商品名がないと登録できない" do
          @item.item_name = nil 
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank", "Item name is invalid")
        end

        it "カテゴリーの情報がないと登録できない" do
          @item.category_id = nil 
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
          # これも含まれてるけどアウトプットはないなぜ？"Category can't be blank", "Category is invalid"
        end

        it "商品の状態についての情報が必須である" do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status Select")
        end

        it "配送料の負担についての情報が必須である" do
          @item.shipping_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge Select")
        end

        it "発送元の地域についての情報が必須である" do
          @item.shipping_region_id =  nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping region Select")
        end

        it "発送日についての情報が必須である" do
          @item.date_shipment_id =  nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Date shipment Select")
        end

        it "価格についての情報が必須である" do
          @item.price =  nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it "価格の範囲が、300円以下だと登録できない" do
          @item.price =  200
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it "価格の範囲が、9,999,999円以上だと登録できない" do
          @item.price =  10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it "販売価格は半角数字のみ入力可能である" do
          @item.price =  "４４４"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is out of setting range")
        end

        it "ユーザーが紐づいていないと商品は保存できない" do
          @item.user_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end 
  end
end
