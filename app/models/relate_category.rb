class RelateCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category

  scope :find_weeks_category, -> { where('created_at >= ?', 7.days.ago).group(:category_id).order(count_all: :desc).count.first }
  def self.find_weeks_category
    where('created_at >= ?', 7.days.ago).group(:category_id).order(count_all: :desc).count.first
  end
end
