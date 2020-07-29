class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 10 }
  has_many :articles, foreign_key: :author_id
end
