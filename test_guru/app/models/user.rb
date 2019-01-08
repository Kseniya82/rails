class User < ApplicationRecord
  has_many :testers, dependent: :restrict_with_exception
  has_many :tests, through: :testers
  has_many :own_tests, class_name: "Test", inverse_of: :creater, dependent: :restrict_with_exception

  def select_all_tests(level)
    tests.where(level: level)
  end
end
