# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # prepend_before_action :require_no_authentication, only: [:cancel ]


  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    @resource = User.find_by_email params[:user][:email]
    if @resource.valid_password?(params[:user][:password])
      sign_in(resource_name, @resource)
      byebug
      render json: {success: true, user: @resource}
    end
    # super
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    if signed_out === true
      puts "testing testing logout"
      render :json => {status: 200}
    else
      render :json => {status: 404}
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def respond_with(resource, _opts = {})
    render json: { message: 'You are logged in.' }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Hmm nothing happened."}, status: :unauthorized
  end
end
