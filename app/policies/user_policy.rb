class UserPolicy < ApplicationPolicy
  attr_reader :user, :uye

    def initialize(user, uye)
      @user = user
      @uye = uye
    end

    def index?
      user.roles.where(role:'SuperAdmin').exists?
    end


    def active_pasive?
      user.roles.where(role: 'SuperAdmin').exists?
    end

end
