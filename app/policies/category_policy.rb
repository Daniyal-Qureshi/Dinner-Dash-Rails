# frozen_string_literal: true

# CategoryPolicy
# CategoryPolicy
class CategoryPolicy < ApplicationPolicy
  def create?
    @user.role == 'admin'
  end

  alias update? create?
  alias new? create?
  alias destroy? create?
  alias edit? create?
end
