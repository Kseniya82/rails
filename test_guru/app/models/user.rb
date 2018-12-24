class User < ApplicationRecord
  def select_all_tests(level)
    Test.joins('JOIN testers ON tests.id = testers.test_id')
    .where(testers: { user_id: self.id }, tests: { level: level })
  end
end
