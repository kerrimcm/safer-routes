# frozen_string_literal: true

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :postcode, :dob, :gender, :ability, :goals])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :postcode, :gender, :ability, :goals])
    # removed dob from account update - this should probably not be updatable.

  end

end
