class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :own_tests, class_name: "Test", inverse_of: :creater, dependent: :restrict_with_exception

  def select_all_tests(level)
    tests.where(level: level)
  end
end
