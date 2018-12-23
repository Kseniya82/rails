class User < ApplicationRecord
  def find_all_tests(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
    .where(tests_users: {user_id: self.id}, tests: {level: level}).pluck('tests.title')
  end
end
