# frozen_string_literal: true

# ItemPolicy
# ItemPolicy
class ItemPolicy < ApplicationPolicy
  def create?
    @user.role == 'admin'
  end

  alias update? create?
  alias new? create?
  alias destroy? create?
  alias edit? create?
end
