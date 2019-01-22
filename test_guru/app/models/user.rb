class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :own_tests, class_name: "Test", inverse_of: :creater, dependent: :restrict_with_exception

  has_secure_password

  validates :email, presence: true, uniqueness: true,
  format: { with: /[a-z0-9]+@{1}[a-z0-9]+.{1}[a-z0-9]{2,3}/, message: "not valide email" }

  def select_all_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
