# frozen_string_literal: true

# Resturant policy
# Resturant policy
class ResturantPolicy < ApplicationPolicy
  def create?
    @user.role == 'admin'
  end

  alias update? create?
  alias new? create?
  alias destroy? create?
  alias edit? create?
end
