require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'orders#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item) # user_id: user.idを入れると同じuserでitemを出品する。
      # itemのFactoryBotのassorsiation :userで別のuserを作っている。
      item.image = fixture_file_upload('public/images/test_image.png')
      item.save
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id )
    end

    describe '購入' do
      context '購入がうまくいくとき' do
        it "郵便番号、都道府県、市区町村、電話番号が正しく入力されている時" do
          expect(@order_address).to be_valid
        end
      end

      context '購入がうまくいかない時' do
        it "tokenがなければ購入できない。" do
          @order_address.token = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("カード情報を入力してください")
        end

        it "郵便番号がなければ購入できない。" do
          @order_address.postal_code = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("郵便番号を入力してください")
        end

        it "郵便番号が半角数字###-####で登録しないと購入できない。" do
          @order_address.postal_code = "kkk-kkkk"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("郵便番号を正しく入力してください")
        end

        it "郵便番号が半角数字且つ「-」ハイフンがなければ購入できない。" do
          @order_address.postal_code = "6561334"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("郵便番号を正しく入力してください")
        end

        it "都道府県が選択されてなかったら購入できない。" do
          @order_address.prefecture_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("都道府県を選択してください")
        end

        it "市町村が記入漏れだったら購入できない。" do
          @order_address.city = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("市区町村を入力してください")
        end

        it "番地が記入漏れだったら購入できない。" do
          @order_address.number = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("番地を入力してください")
        end

        it "電話番号が未入力だったら購入できない。" do
          @order_address.phone = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("電話番号を入力してください")
        end
        
        it "電話番号が0から始まる数字でなければ購入できない。" do
          @order_address.phone = "99999999999"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("電話番号を[-]は入れず、半角数字で入力してください")
        end

        it "電話番号に「-」があれば購入できない。" do
          @order_address.phone = "080-0808-0808"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("電話番号を[-]は入れず、半角数字で入力してください")
        end

        it "電話番号は11桁以下でなければ購入できない。" do
          @order_address.phone = "0808888888888"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include ("電話番号が間違っています")
        end

      end
    end
  end
end
