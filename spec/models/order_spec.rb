require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id , item_id: @item.id)
    end

    context '商品出品ができる時' do
      it 'token,postal_code,prefecture,city,address,building,phone_numberが存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'postal_codeにハイフンがあれば保存できること（123-4567となる）' do
        @order.postal_code = '123-4567'
        @order.valid?
        expect(@order).to be_valid
      end
      it 'phone_numberにハイフンがなく、11桁以内であれば保存できる（09012345678となる）' do
        @order.phone_number = '09012345678'
        @order.valid?
        expect(@order).to be_valid
      end
      it 'buildingが空でも保存できないこと' do
        @order.building = nil
        @order.valid?
        expect(@order).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'tokenが空だと保存できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがなければ保存できないこと' do
        @order.postal_code = 1_234_567
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefectureが---では登録できない' do
        @order.prefecture = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと保存できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフン（数字以外）が含まれると保存できないこと' do
        @order.phone_number = '090-000-000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが11桁よりも多い場合保存できないこと' do
        @order.phone_number = '090000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number Out of setting range')
      end
      it 'item_idが空だと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
