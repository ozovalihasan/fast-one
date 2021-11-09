class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, foreign_key: "consumer_id", dependent: :destroy
  has_one :cart, foreign_key: "consumer_id", dependent: :destroy
  has_many :questions, foreign_key: "consumer_id", dependent: :destroy
  has_many :products, foreign_key: "seller_id", dependent: :destroy
  has_many :answers, foreign_key: "seller_id", dependent: :destroy
end
