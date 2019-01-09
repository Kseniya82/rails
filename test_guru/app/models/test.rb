class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  belongs_to :creater, class_name: "User", foreign_key: "user_id", inverse_of: :own_tests

  def self.select_by_category(title)
    joins(:category).where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end
