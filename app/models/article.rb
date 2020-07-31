class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 25 }
  validates :text, presence: true, length: { maximum: 200 }
  validates_presence_of :image

  belongs_to :author, class_name: 'User'
  has_many :votes
  has_many :saved_articles , class_name: 'SaveArticle'

  has_many :relatecategories, class_name: 'RelateCategory'
  has_many :categories, through: :relatecategories
end
