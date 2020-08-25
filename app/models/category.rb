class Category < ActiveRecord::Base
  validates_uniqueness_of :name

  has_many :relate_categories, class_name: 'RelateCategory'
  has_many :articles, through: :relate_categories

  scope :category_prior, -> { order(:priority) }
  def self.category_prior
    order(:priority)
  end
end
