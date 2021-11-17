class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: {
    'Consumer' => 0,
    'Seller'=> 1,
    'Admin' => 2
  }, _prefix: true
      
  has_many :orders, foreign_key: "consumer_id", dependent: :destroy
  has_one :cart, foreign_key: "consumer_id", dependent: :destroy
  has_many :questions, foreign_key: "consumer_id", dependent: :destroy
  has_many :products, foreign_key: "seller_id", dependent: :destroy
  has_many :answers, foreign_key: "seller_id", dependent: :destroy

  # def seller?
  #   type == "Seller"
  # end

  # def consumer?
  #   type == "Consumer"
  # end

  # def admin?
  #   type == "Admin"
  # end

 
end
