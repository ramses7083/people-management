# frozen_string_literal: true

class ErrorController < ApplicationController
  before_action :review_token

  def index
    @error = "ENV['SALESLOFT_TOKEN'] is not available"
  end

  def review_token
    redirect_to people_path if ENV['SALESLOFT_TOKEN'].present?
  end
end
