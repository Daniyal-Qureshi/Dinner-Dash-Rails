# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :initialize_session

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  def route_not_found
    redirect_to root_path, notice: 'Route not found'
  end

  def initialize_session
    session[:items] = [] unless session.key?('items')
  end
end
