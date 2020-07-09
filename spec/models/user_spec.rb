require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = build(:user)
  end

  describe 'バリデーション' do

    it "ニックネーム、メール、パスワード、姓名、姓名カナ、生年月日がある場合、有効である" do
      expect(@user).to be_valid
    end

    it "ニックネームがない場合、無効である" do
      @user.nickname = ''
      expect(@user.valid?).to eq(false)
    end

    it "メールアドレスがない場合、無効である" do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
    
    it "重複したメールアドレスの場合、無効である" do
      user = create(:user, email: "test@mail.com")
      another_user = build(:user, email: "test@mail.com")
      expect(another_user.valid?).to eq(false)
    end

    it "＠がないメールアドレスの場合、無効である" do
      @user.email = 'emailgmail.com'
      expect(@user.valid?).to eq(false)
    end

    it "パスワードがない場合、無効である" do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

    it "確認入力用パスワードがない場合、無効である" do
      @user.password_confirmation = ''
      expect(@user.valid?).to eq(false)
    end

    it "パスワードが英数字混合でない場合、無効である" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user.valid?).to eq(false)
    end

    it "パスワードが半角でない場合、無効である" do
      @user.password = '１２３４５Ａ'
      @user.password_confirmation = '１２３４５Ａ'
      expect(@user.valid?).to eq(false)
    end

    it "パスワードが6文字以上の場合、有効である"  do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end

    it "パスワードが5文字以下の場合、無効である" do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      expect(@user.valid?).to eq(false)
    end
    
    it "名がない場合、無効である" do
      @user.first_name = ''
      expect(@user.valid?).to eq(false)
    end

    it "姓がない場合、無効である" do
      @user.family_name = ''
      expect(@user.valid?).to eq(false)
    end

    it "名が全角でない場合、無効である" do
      @user.first_name = 'hanako'
      expect(@user.valid?).to eq(false)
    end

    it "姓が全角でない場合、無効である" do
      @user.family_name = 'yamada'
      expect(@user.valid?).to eq(false)
    end

    it "名カナがない場合、無効である" do
      @user.first_name_kana = ''
      expect(@user.valid?).to eq(false)
    end

    it "姓カナがない場合、無効である" do
      @user.family_name_kana = ''
      expect(@user.valid?).to eq(false)
    end

    it "名カナが全角カタカナでない場合、無効である" do
      @user.first_name_kana = 'はなこ'
      expect(@user.valid?).to eq(false)
    end

    it "姓カナが全角カタカナでない場合、無効である"do
      @user.first_name_kana = 'やまだ'
      expect(@user.valid?).to eq(false)
    end

    it "生年がない場合、無効である" do
      @user.birth_year_id = ''
      expect(@user.valid?).to eq(false)
    end

    it "生月がない場合、無効である" do
      @user.birth_month_id = ''
      expect(@user.valid?).to eq(false)
    end

    it "生日がない場合、無効である" do
      @user.birth_day_id = ''
      expect(@user.valid?).to eq(false)
    end

  end 



end