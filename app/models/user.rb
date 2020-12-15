class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end
    
  with_options presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]/,message: "全角(ひらがな カタカナ 漢字)が使えます"} do
    validates :family_name
    validates :last_name
  end

  with_options presence: true,format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カタカナのみが使えます"} do
    validates :family_name_kana
    validates :last_name_kana
  end

  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "半角英数字混合のみ使えます"}

  has_many :items
  has_many :purchases
end