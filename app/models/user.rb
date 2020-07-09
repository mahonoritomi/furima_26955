class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    has_many :items
    has_many :purchases
    has_many :comments
    has_many :addresses
  

  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :email, uniqueness: true

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角漢字・ひらがな・カタカナで入力して下さい" } do
      validates :first_name
      validates :family_name
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力して下さい" } do
      validates :first_name_kana
      validates :family_name_kana
    end

    validates_format_of :password, :with => /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, :message => "パスワードには必ず英字・数字の両方を含めてください"
 
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birth_year
  belongs_to_active_hash :birth_month
  belongs_to_active_hash :birth_day

  with_options presence: true do
    validates :birth_year
    validates :birth_month
    validates :birth_day
 
  end

  # with_options numericality: { other_than: 1 } do
  #   validates :birth_year
  #   validates :birth_month
  #   validates :birth_day
  # end

end
