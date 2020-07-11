require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = build(:item)
  end

  describe 'バリデーション' do
    it "画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元、発送日数、300〜9999999円以内の価格がある場合、有効である" do
      expect(@item).to be_valid
    end

    it "画像がない場合、無効である" do
      @item = build(:item_noimage)
      expect(@item.valid?).to eq(false)
    end

    it "商品名がない場合、無効である" do
      @item.name = ''
      expect(@item.valid?).to eq(false)
    end

    it "商品の説明がない場合、無効である" do
      @item.explanation = ''
      expect(@item.valid?).to eq(false)
    end

    it "カテゴリーがない場合、無効である" do
      @item.category_id = ''
      expect(@item.valid?).to eq(false)
    end

    it "商品の状態がない場合、無効である" do
      @item.condition_id = ''
      expect(@item.valid?).to eq(false)
    end

    it "配送料の負担がない場合、無効である" do
      @item.delivery_fee_id = ''
      expect(@item.valid?).to eq(false)
    end

    it "発送元の地域がない場合、無効である" do
      @item.ship_from_id = ''
      expect(@item.valid?).to eq(false)
    end

    it "発送までの日数がない場合、無効である" do
      @item.transport_days_id = ''
      expect(@item.valid?).to eq(false)
    end

    it "価格がない場合、無効である" do
      @item.price = ''
      expect(@item.valid?).to eq(false)
    end

    it "価格が300円未満の場合、無効である" do
      @item.price = 200
      expect(@item.valid?).to eq(false)
    end

    it "価格が10,000,000以上の場合、無効である" do
      @item.price = 10000000
      expect(@item.valid?).to eq(false)
    end

  end



end