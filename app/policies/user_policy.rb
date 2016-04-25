class UserPolicy < ApplicationPolicy
  attr_reader :user, :uye

    def initialize(user, uye)
      @user = user
      @uye = uye
    end


    def active_pasive?
      uye.roles.where(role: 'SuperAdmin').exists?
    end

end
