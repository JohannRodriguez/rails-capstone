class Article < ApplicationRecord
  validates :title, presence:true, uniqueness: true, length: { minimum: 5, maximum:25}
  validates :text, presence:true, length: { maximum: 200 }

  belongs_to :author, class_name: 'User'
  has_many :votes
end
