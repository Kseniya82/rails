class User < ApplicationRecord
  has_many :testers
  has_many :tests, through: :testers

  def select_all_tests(level)
    Test.joins('JOIN testers ON tests.id = testers.test_id')
    .where(level: level, testers: { user_id: self.id } )
  end
end
