class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :code,     presence: true
  #PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  #validates_format_of :password, allow_blank: true, with: PASSWORD_REGEX, message: '英数字の両方を含めて半角で入力してください'

  has_many :situations, dependent: :destroy
  belongs_to :family_account, optional: true #optional: true をつけてユーザー登録時は入力を避ける
  # 親テーブルのレコードを削除した際、同時に関連する子テーブルのレコードも削除させるため
end
