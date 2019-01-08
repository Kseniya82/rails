class User < ApplicationRecord
  def select_all_tests(level)
    Test.joins('JOIN testers ON tests.id = testers.test_id')
    .where(level: level, testers: { user_id: self.id } )
  end
end
