require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do 
    @address_purchase = build(:address_purchase)
  end

  describe 'バリデーション' do
    context '有効' do
      it "郵便番号、市区町村、番地、電話番号、user_id, item_idがある場合、有効である" do
        expect(@address_purchase).to be_valid
      end
    end

    context '無効' do
      it "郵便番号がない場合、無効である" do
        @address_purchase.zipcode = ''
        expect(@address_purchase.valid?).to eq(false)
      end

      it "都道府県がない場合、無効である" do
        @address_purchase.prefecture_id = ''
        expect(@address_purchase.valid?).to eq(false)
      end

      it "市区町村がない場合、無効である" do
        @address_purchase.city = ''
        expect(@address_purchase.valid?).to eq(false)
      end

      it "番地がない場合、無効である" do
        @address_purchase.address_line = ''
        expect(@address_purchase.valid?).to eq(false)
      end

      it "電話番号がない場合、無効である" do
        @address_purchase.phone_number = ''
        expect(@address_purchase.valid?).to eq(false)
      end

      it "郵便番号がハイフンなしの場合、無効である" do
        @address_purchase.zipcode = '1234567'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "郵便番号が8桁以上の場合、無効である" do
        @address_purchase.zipcode = '123-45678'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "電話番号が6桁以下の場合、無効である" do
        @address_purchase.zipcode = '11-1111'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "郵便番号が全角数字の場合、無効である" do
        @address_purchase.zipcode = '１２３−４５６７８'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "郵便番号が数字以外の場合、無効である" do
        @address_purchase.zipcode = 'aaa-aaaa'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "電話番号がハイフンありの場合、無効である" do
        @address_purchase.phone_number = '080-1234-5678'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "電話番号が12桁以上の場合、無効である" do
        @address_purchase.phone_number = '080123456789'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "電話番号が9桁以下の場合、無効である" do
        @address_purchase.phone_number = '081234567'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "電話番号が全角数字の場合、無効である" do
        @address_purchase.phone_number = '０８０１２３４５６７８'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "電話番号が数字以外の場合、無効である" do
        @address_purchase.phone_number = 'aaaaaaaaaaa'
        expect(@address_purchase.valid?).to eq(false)
      end

      it "user_idがない場合、無効である" do
        @address_purchase.user_id = ''
        expect(@address_purchase.valid?).to eq(false)
      end

      it "item_idがない場合、無効である" do
        @address_purchase.item_id = ''
        expect(@address_purchase.valid?).to eq(false)
      end
    end

  end



end