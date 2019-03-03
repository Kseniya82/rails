class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
    @badges = @user.badges
  end

  def call
    byebug
    Badge.all.each do |badge|
      if send(badge.rule_name, badge.rule_value)
        @badges << badge
      end
    end
  end

  private

  def category(title)
    return false if @test.category.title != title

    test_ids = Test.select_by_category(title).ids
    count_success_test(test_ids) == test_ids.count
  end

  def level(level)
    return false if @test.level != level
    test_ids = Test.where(level: level).ids
    count_success_test(test_ids) == test_ids.count
  end

  def count_success_test(test_ids)
    @user.test_passages.where(test_id: test_ids).success.uniq.count
  end

  def attempt(attempt)
    @user.test_passages.where(test_id: @test.id).count == attempt && count_success_test(@test.id) == 1
  end

end
