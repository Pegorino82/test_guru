# frozen_string_literal: true

module Admin
  class TestsController < Admin::BaseController
    before_action :find_tests, only: %i[index update_inline]
    before_action :find_test, only: %i[show edit update destroy start update_inline]

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

    def index; end

    def show; end

    def new
      @test = Test.new
    end

    def edit; end

    def create
      @test = current_user.authorship.build(test_params)
      if @test.save
        redirect_to admin_test_path(@test), notice: t('.success')
      else
        render :new
      end
    end

    def update
      if @test.update(test_params)
        redirect_to admin_test_path(@test)
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
      @test.destroy!

      redirect_to admin_tests_url
    end

    private

    def find_tests
      @tests = Test.all
    end

    def find_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:title, :level, :category_id)
    end

    def rescue_with_test_not_found
      render plain: 'Not found'
    end
  end
end
