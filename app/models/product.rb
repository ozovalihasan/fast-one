class Product < ApplicationRecord
  include PgSearch::Model
  
  belongs_to :seller , class_name: "User"
  belongs_to :category
  has_many :order_items
  has_many :reviews
  has_many :shipping_locations
  has_many :questions

  pg_search_scope :search_name,
                  against: %i[name description],
                  using: { 
                    tsearch: { 
                      dictionary: 'english', 
                      tsvector_column: 'searchable'
                    } 
                  }


  def average_star
    reviews_size = reviews.length
    return 0 if reviews_size.zero?
    (reviews.pluck(:star).sum / reviews_size.to_f).round(1) 
  end
  
end
