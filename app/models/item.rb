class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :term

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :image, presence: true
  
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :charge_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :term_id, numericality: { other_than: 1 } 
  with_options presence: true, format: { with:/\A[0-9]+\z/} do
    validates :price, numericality: { only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
