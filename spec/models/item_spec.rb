require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '項目が全て正しく記述、選択されていれば保存できる' do
      expect(@item).to be_valid
    end

    it '画像が選択されていない時保存ができない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空の時保存ができない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空の時保存ができない' do
      @item.describe = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Describe can't be blank")
    end

    it 'カテゴリーが選択されていない時保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category  Select')
    end

    it '商品の状態が選択されていない時保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it '配送料の負担が選択されていない時保存できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage Select')
    end

    it '発送元の地域が選択されていない時保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it '発送までの日数が選択されていない時保存できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day Select')
    end

    it '価格がからの場合保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Half-width number', 'Price Out of setting range')
    end

    it '価格が¥300以下の時保存できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格が¥9,999,999以上の時保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格が半角数字でない時保存できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
    end
  end
end
