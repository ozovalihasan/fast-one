class Question < ApplicationRecord
  belongs_to :product 
  belongs_to :consumer , class_name: "User"
  has_many :answers
end
