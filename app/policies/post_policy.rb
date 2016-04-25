class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    user.roles.where(role: 'SuperAdmin').exists?
  end

  def show?
    user.roles.where(role: 'SuperAdmin').exists?
  end

  def destroy?
    user.roles.where(role: 'SuperAdmin').exists?
  end


end
