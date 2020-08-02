class Category < ApplicationRecord
  has_many :relate_categories, class_name: 'RelateCategory'
  has_many :articles, through: :relate_categories
end
