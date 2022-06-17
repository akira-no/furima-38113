class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers
  
  with_options presence: true do
    validates :password,      format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }
    validates :nickname
    validates :last_name,     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name,    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_sei,      format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :name_mei,      format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_date
  end   
end
