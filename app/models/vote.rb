class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  scope :find_vote, -> { where(user_id: user, article_id: article.id) }
  def self.find_vote(user, article)
    where(user_id: user, article_id: article.id)
  end

  scope :find_most_voted, -> { group(:article_id).order(count_all: :desc).count.first }
  def self.find_most_voted
    group(:article_id).order(count_all: :desc).count.first
  end
end
