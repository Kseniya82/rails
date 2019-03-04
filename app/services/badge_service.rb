class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.select do |badge|
      send(badge.rule_name, badge.rule_value)
    end
  end

  private

  def category(category_id)
    return false  unless @test_passage.successful?
    return false if @test.category_id != category_id.to_i

    test_ids = Test.where(category_id: category_id).ids
    count_success_test(test_ids) == test_ids.count
  end

  def level(level)
    return false  unless @test_passage.successful?
    return false if @test.level != level.to_i
    test_ids = Test.where(level: level).ids
    count_success_test(test_ids) == test_ids.count
  end

  def count_success_test(test_ids)
    @user.test_passages.where(test_id: test_ids).success.uniq.count
  end

  def attempt(str_attempt)
    return false  unless @test_passage.successful?
    (@user.test_passages.where(test_id: @test.id).count == str_attempt.to_i) && (count_success_test(@test.id) == 1)
  end

end
