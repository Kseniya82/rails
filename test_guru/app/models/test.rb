class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy
  belongs_to :creater, class_name: "User", foreign_key: "user_id", inverse_of: :own_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :midle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :select_by_category, -> (title){ joins(:category).where(categories: { title: title }).pluck(:title) }
end
