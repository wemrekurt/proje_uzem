class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def create
    if current_user != nil
      if current_user.isActive == true
        self.resource = warden.authenticate!(auth_options)
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
          respond_with resource, location: after_sign_in_path_for(resource)
      else
        redirect_to new_user_session_path,  notice:  "Hesabınız Aktif Değil"
      end
    else
      redirect_to new_user_registration_path
    end
  end


=begin
  def create
   @user=User.new(sign_in_params)
   @us=User.where(["email= ?",@user.email]).first
   if(@us!=nil)

     if(@us.isActive==true)

       self.resource = warden.authenticate!(auth_options)
       set_flash_message(:notice, :signed_in) if is_flashing_format?
       sign_in(resource_name, resource)
       yield resource if block_given?
       respond_with resource, location: after_sign_in_path_for(resource)
     else
        redirect_to new_user_session_path,  notice:  "Hesabınız Aktif Değil"
     end
   else
     redirect_to new_user_registration_path
   end
 end
=end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
