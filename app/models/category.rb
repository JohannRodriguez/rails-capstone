class Category < ApplicationRecord
  validates_uniqueness_of :name

  has_many :relate_categories, class_name: 'RelateCategory'
  has_many :articles, through: :relate_categories
end
