class Test < ApplicationRecord
  def self.select_by_category(title)
    self.joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: title }).order(title: :desc)
  end
end
