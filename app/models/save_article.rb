class SaveArticle < ApplicationRecord
  belongs_to :user
  belongs_to :article

  scope :favorite_created_at_sort, -> { order('created_at').reverse_order }
  def self.favorite_created_at_sort
    order('created_at').reverse_order
  end
end
