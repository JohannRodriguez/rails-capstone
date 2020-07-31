class Category < ApplicationRecord
  has_many :relatecategories, class_name: 'RelateCategory'
  has_many :articles, through: :relatecategories
end
