class Test < ApplicationRecord
  def self.find_by_category(title)
    self.joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: title}).order('tests.title DESC')
    .pluck('tests.title')
  end
end
