# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    render json: Test.all
  end

  def show
    render json: Test.find(params[:id])
  end
end
