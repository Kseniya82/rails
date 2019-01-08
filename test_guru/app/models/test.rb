class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :testers
  has_many :users, through: :testers

  def self.select_by_category(title)
    self.joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: title }).order(title: :desc)
  end
end
