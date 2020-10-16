require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '#create' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    context '商品購入ができる時' do
      it '必須項目が全ての入力が正しく行われている時保存できる' do
        expect(@order_form).to be_valid
      end
      it 'tokenが空では保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では保存できない' do
        @order_form.postcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode can't be blank", 'Postcode Input correctly')
      end
      it '都道府県が空では保存できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空では保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できない' do
        @order_form.phone_num = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num can't be blank", 'Phone num Input only number')
      end
      it '郵便番号がハイフンが存在しないと保存できない' do
        @order_form.postcode = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode Input correctly')
      end

      it '電話番号にハイフンが存在すると登録できない' do
        @order_form.phone_num = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone num Input only number')
      end
      it '電話番号が11桁以上だと登録できない' do
        @order_form.phone_num = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone num Input only number')
      end
    end
  end
end
