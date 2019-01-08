class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :testers, dependent: :restrict_with_exception
  has_many :users, through: :testers
  belongs_to :creater, class_name: "User", foreign_key: "user_id", inverse_of: :own_tests

  def self.select_by_category(title)
    joins(:category).where(categories: { title: title })
  end
end
