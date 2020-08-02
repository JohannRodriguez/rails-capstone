class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 25 }
  validates :text, presence: true, length: { maximum: 2000 }
  validates_presence_of :image

  belongs_to :author, class_name: 'User'
  has_many :votes
  has_many :saved_articles , class_name: 'SaveArticle'

  has_many :relate_categories, class_name: 'RelateCategory'
  has_many :categories, through: :relate_categories
end
