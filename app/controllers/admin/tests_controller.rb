class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: [:index, :update_inline]
  before_action :find_test, only: [:show, :update, :destroy, :edit, :update_inline]

  def index; end

  def edit; end

  def show
    @questions = @test.questions
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def new
    @test = current_user.own_tests.new
  end

  def create
    @test = current_user.own_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :time_limit)
  end
end
