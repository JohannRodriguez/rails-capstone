class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 5, maximum: 55 }
  validates :text, presence: true, length: { maximum: 4000 }
  validates_presence_of :image

  belongs_to :author, class_name: 'User'
  has_many :votes
  has_many :saved_articles, class_name: 'SaveArticle'

  has_many :relate_categories, class_name: 'RelateCategory'
  has_many :categories, through: :relate_categories

  scope :created_at_sort, -> { order('created_at').reverse_order }
  def self.created_at_sort
    order('created_at').reverse_order
  end

  scope :find_weeks_article, -> { where('articles.created_at >= ?', 7.days.ago).reverse_order.first }
  def self.find_weeks_article
    where('articles.created_at >= ?', 7.days.ago).reverse_order.first
  end


end
