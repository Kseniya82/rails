class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :own_tests, class_name: "Test", inverse_of: :creater, dependent: :restrict_with_exception

  validates :email, presence: true, uniqueness: true, format: { with: /@/, message: "not valid email" }

  def select_all_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
