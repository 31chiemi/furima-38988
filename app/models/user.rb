class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true
  with_options presence: true, format: { with:/\A[ァ-ヶー－]+\z/} do
    validates :last_name_kana
    validates :first_name_kana
  end
end
