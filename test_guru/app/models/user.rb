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

  def admin?
    is_a?(Admin)
  end

  def select_all_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def full_name
    "#{first_name} #{last_name}" if first_name.present? && last_name.present?
  end
end
