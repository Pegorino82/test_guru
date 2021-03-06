# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.paginate(page: params[:page], per_page: 5)
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)

    redirect_to current_user.result(@test)
  end

  private

  def rescue_with_test_not_found
    render plain: 'Not found'
  end
end
